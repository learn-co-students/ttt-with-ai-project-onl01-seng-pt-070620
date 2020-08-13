require 'pry'
class Board 
  attr_accessor :cells
  
  def initialize
    reset!
  end
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display 
    line = "-----------"
    row1 = [@cells[0], @cells[1], @cells[2]].join(' | ')
    row2 = [@cells[3], @cells[4], @cells[5]].join(' | ')
    row3 = [@cells[6], @cells[7], @cells[8]].join(' | ')
    puts " #{row1} "
    puts line
    puts " #{row2} "
    puts line
    puts " #{row3} "
  end
  
  def full?
    @cells.include?(" ") ? false : true
  end
  
  def position(user_input)
    user_input = user_input.to_i - 1
    @cells[user_input]
  end

  def turn_count
    turn_num = 0
    @cells.each do |cell|  
      if cell == 'X' || cell == 'O'
        turn_num += 1
      end
    end
    turn_num
  end
  
  def valid_move?(input)
    input = input.to_i #input is 1 right now as an INT
    input >= 1 && input <= 9  && @cells[input - 1] != "X" && @cells[input - 1] != "O" ? true : false
  end

  def taken?(index)
    position(index) == "X" || position(index) == "O" ? true : false 
  end
  
  def update(user_input, player)
    user_input = user_input.to_i - 1
    @cells[user_input] = player.token
  end
  
  def cells=(cells)
    @cells = cells
  end
end