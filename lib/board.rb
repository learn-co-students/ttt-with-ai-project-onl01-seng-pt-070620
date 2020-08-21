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
    binding.pry
    board = Board.new
    puts board.cells
  end
  
 
  
end