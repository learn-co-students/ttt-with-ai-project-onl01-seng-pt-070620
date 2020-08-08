require 'pry'
module Players
  class Computer < Player
    def move(board)
      cpu_move = rand(10)
      cpu_move = cpu_move.to_s
    end
  end
end