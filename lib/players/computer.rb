require 'pry'
module Players
  class Computer < Player
    def move(board)
      
      cpu_move = rand(10)
      cpu_move = cpu_move.to_s unless board.cells[cpu_move.to_i - 1] != " "
      # binding.pry
    end
  end
end