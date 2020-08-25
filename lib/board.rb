class Board
    attr_accessor :cells

    board.cells = []

    def reset!
        @board.cells = Array.new(9, " ")
    end 

    def initialize
        @board.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end 

    def display
        puts " #{@board.cells[0]} | #{@board.cells[1]} | #{@board.cells[2]} "
        puts "-----------"
        puts " #{@board.cells[3]} | #{@board.cells[4]} | #{@board.cells[5]} "
        puts "-----------"
        puts " #{@board.cells[6]} | #{@board.cells[7]} | #{@board.cells[8]} "
    end 

    def move(board, index, user_input)
        board[index] = user_input
    end

    def position(user_input)
        input = user_input_to_i - 1
    end 

    def update
    end 

    def full?(board)
        board.all? {|i| i != " "}
    end 

    def turn_count(board)
        turns = 0
        board.each do |element|
          if element == "X" || element == "O"
          turns += 1
          end
        end
      return turns
    end 

    def taken?(board, index)
        if board[index] == " " || board[index] == "" || board[index] == nil
            return false
          end
          if board[index] == "X" || board[index] == "O"
            return true
          end
    end 

    def valid_move?(board, index)
        if !position_taken?(board, index) && index.between?(0, 8)
            return true
          else
           return false
          end
    end 

end 