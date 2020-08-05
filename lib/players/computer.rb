require 'pry'
module Players
  class Computer < Player
    def move(board)
      response = board.cells.find_index{|i| i == ' '}  + 1 # add one because board update subtracts one thinking its
      # human input
      #binding.pry
      puts 'COMPUTER TRYING TO MOVE'
      response
    end
  end
end