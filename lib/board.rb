require 'pry'
class Board
  
  attr_accessor :cells
  
  def initialize
    @cells = Array.new(9," ")
    
  end

  def reset!
    @cells = Array.new(9," ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    @cells[input.to_i - 1]  
  end
  
  def full?
    @cells.all? {|occupied| occupied != " "}
  end
 
  def turn_count
    @cells.count {|char| char == "X" || char == "O"}
  end
 
  def taken?(input)
    @cells[ input.to_i - 1 ] == "X" || @cells[ input.to_i - 1 ] == "O"
  end

  def valid_move?(input)
    index = input.to_i-1
    index.between?(0,8) && !taken?(input)
  end

  def update (input, token = "X")
    index = input.to_i-1
    @cells[index] = token
  end



end