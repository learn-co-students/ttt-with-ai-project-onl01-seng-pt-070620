require 'pry'
class Board
  attr_accessor :cells
  def initialize
    @cells = Array.new(9,' ')
  end

  def reset!
    @cells = Array.new(9, ' ')
  end

  def display
    puts " #{@cells[0]} ".red + "| ".green +  "#{@cells[1]} ".red + "| ".green + "#{@cells[2]} ".red
    puts '-----------'.green
    puts " #{@cells[3]} ".red + "| ".green +  "#{@cells[4]} ".red + "| ".green + "#{@cells[5]} ".red
    puts '-----------'.green
    puts " #{@cells[6]} ".red + "| ".green +  "#{@cells[7]} ".red + "| ".green + "#{@cells[8]} ".red
  end

  def position(userinput)
    @cells[userinput.to_i - 1] # find what is at that number
  end

  def update(userinput,currentPlayer)
    @cells[userinput.to_i - 1] = currentPlayer.token #if @cells[userinput.to_i - 1] == ' ' # update cell with players token
  end

  def full?
    @cells.all? { |cell| cell != ' ' } # are all the cells equal to ' ' ?
  end

  def turn_count
    @cells.count{ |cell| cell != ' ' } # count how many cells are not blank
  end

  def taken?(playersMove)
    position(playersMove) != ' '
  end

  def valid_move?(playersMove)
    playersMove.to_i.between?(1, 9) && @cells[playersMove.to_i - 1] == ' ' ? true : false
    # check if playersMove passed in is between 1-9 and check if array index is empty ' '
  end

  def empty_cells
    emptycells = []
    @cells.each_with_index do |cell, i|
      emptycells << i if cell == ' '
    end
    emptycells
  end

end