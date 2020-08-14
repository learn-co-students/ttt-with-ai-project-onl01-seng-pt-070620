require 'pry'
class Board
  attr_accessor :cells
  
    @cells = []
  
  def initialize
    @cells = (Array.new(9, " "))
  end
  
  def reset!
    cells.clear
    @cells = (Array.new(9, " "))
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(user_input)
    @cells[user_input.to_i - 1]
  end
  
  def full?
    @cells.all?{|cell| cell != " " }
  end
  
  def turn_count
    @cells.count{|cell| cell != " " }
  end
  
  def taken?(index)
    
  end
  
end