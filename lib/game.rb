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
            @board.cells[win_combination[0]] == @board.cells[win_combination[1]] && @board.cells[win_combination[1]] == @board.cells[win_combination[2]] && position_taken?(win_combination[0])
        end
    end

    def draw?
        if @board.full? && !won?
            true
        else
            false
        # elsif @board.full? && !won?
        #     false
        end
    end

    def over?
        # binding.pry
        draw? || won?
    end

    def winner
        if win_combo = won?
            winner = @board.cells[win_combo.first]
        else
            nil
        end
    end

    def turn
        player = current_player
        current_move = player.move(@board)
        if @board.valid_move?(current_move)
            @board.update(current_move, player)
            @board.display
            player = current_player
        else
            turn
        end
    end

    def play
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

    def start
        @board.display
        play
    end
end