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
        # returns true for draw or win
        # returns false for in progress game
        WIN_COMBINATIONS.detect do |win_combination|
            # binding.pry
            @board.cells[win_combination[0]] == @board.cells[win_combination[1]] && @board.cells[win_combination[1]] == @board.cells[win_combination[2]] && position_taken?(win_combination[0])
        end
    end

    def draw?
        if self.full? && !self.won?
            true
        elsif self.won?
            false
        elsif !self.full? && !self.won?
            false
        end
    end

    def full?
        @board.cells.all? do |block|
            if block == "X" || block == "O"
                true
            else
                false
            end
        end
    end

    def over?
        self.draw? || self.won?
    end

end