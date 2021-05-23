class Game
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def current_player
        @board.turn_count % 2 == 0 ? player_1 : player_2
    end

    def position_taken?(index)
        if @board.cells[index] == " " || @board.cells[index] == "" || @board.cells[index] == nil
          false  
        elsif @board.cells[index] == "X" || @board.cells[index] == "O"
          true
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |win_combination|
            # binding.pry
            @board.cells[win_combination[0]] == @board.cells[win_combination[1]] && @board.cells[win_combination[1]] == @board.cells[win_combination[2]] && position_taken?(win_combination[0])
        end
    end

    def draw?
        if @board.full? && !self.won?
            true
        elsif self.won?
            false
        elsif @board.full? && !self.won?
            false
        end
    end

    def over?
        self.draw? || self.won?
    end

    def winner
        if win_combo = won?
            winner = @board.cells[win_combo.first]
        else
            nil
        end
    end

    def turn
        puts "Please enter 1-9:"
        # user_input = gets.strip
        # index = @board.position(user_input)
        # token = self.current_player
        # binding.pry
        # if @board.valid_move?(index)
        #     @board.update(index, token)
        # else
        #     turn
        # end
        # @board.display
    end

    # def start

    # end

end