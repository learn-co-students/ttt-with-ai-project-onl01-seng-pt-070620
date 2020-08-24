require "pry"

class Game 

    attr_accessor :board, :player_2, :player_1

    def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board

    end



    def won?
        WIN_COMBINATIONS.find do |combo| 
            @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[2]] == @board.cells[combo[1]] && @board.taken?(combo[0]+1)

        end

    end

    def draw?
        !won? && @board.full?

    end


    def over?
        won? || draw?

    end

    def winner
        combo_array = won?
        if combo_array
            @board.cells[combo_array[0]]
        end

    end

    def current_player
        @board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    def play
        if !over?
            turn
            won?
            draw?
            play
        elsif won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end

    end

    def turn
        player = current_player
        current_move = player.move(@board)
        if @board.valid_move?(current_move)
            @board.display
            @board.update(current_move, player)
            @board.display

        else
            turn
        end



        # binding.pry
    end




    # WIN_COMBINATIONS holds 8 possible winning combinations of 3 board positions
    WIN_COMBINATIONS = [
        #Board layout
        # 0 | 1 | 2
        #-----------
       # 3 | 4 | 5
        #-----------
       # 6 | 7 | 8

        [0,1,2], # Top row
        [3,4,5],  # Middle row
        [6,7,8],  # Bottom row
        [0,3,6],  # Left col
        [1,4,7],  # Middle col
        [2,5,8],  # Right col
        [0,4,8],  # Diagnol 1
        [2,4,6]  # Diagnol 2
      ] 

      RSpec.configure do |config|
        config.mock_with :rspec do |mocks|
          mocks.allow_message_expectations_on_nil = true
        end
      end
end