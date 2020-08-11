class Game
    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [2,4,6],
        [0,4,8]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        board.turn_count.even? ? @player_1 : @player_2
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
            if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
                return combo
            elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
                return combo
            end
        end
        return false
    end

    def draw?
        board.full? && !won? ? true : false
    end

    def over?
        draw? || won? ? true : false
    end

    def winner
        WIN_COMBINATIONS.detect do |combo|
            if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
                return "X"
            elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
                return "O"
            end
        end
    end

    def turn
        puts "Please enter a number between 1 and 9"
        @user_input = current_player.move(@board)
        if @board.valid_move?(@user_input)
            @board.update(@user_input, current_player)
        else
            turn
        end
    end

    def play
        turn until over?
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
end