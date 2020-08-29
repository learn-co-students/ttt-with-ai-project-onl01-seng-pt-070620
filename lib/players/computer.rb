module Players
  class Computer < Player
      def move(board)
        input = ""
        case input
        when board.cells[4] = ""
          "5"
        when board.cells[0] = "" 
          "1"
        when board.cells[2] = ""
          "3"
        when board.cells[7] = ""
          "8"
        when board.cells[3] = ""
          "4"
        when board.cells[5] = ""
          "6"
        when board.cells[1] = ""
          "2"
        else
          board.cells[6] = ""
            "7"
        end
      end
    end
  end