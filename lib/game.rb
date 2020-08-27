class Game 

      attr_accessor :board, :player_1, :player_2

      @board = []
      
      WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
      ]

      # def player_1
      #     player_1 = Player.new("X")
      #     self.player_1 = player_1
      # end 

      # def player_2 
      #     self.player_2 = Player.new
      #     player_1 = Player.new("X") 
      # end 

      def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
          @player_1 = player_1
          @player_2 = player_2
          @board = board
        end

      def current_player
        board.turn_count % 2 == 0 ? player_1 : player_2
      end 

      def won?
        WIN_COMBINATIONS.each do |win_combination|
          position_1 = self.board.cells[win_combination[0]]
          position_2 = self.board.cells[win_combination[1]]
          position_3 = self.board.cells[win_combination[2]]

          if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return win_combination
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return win_combination
          end 
        end 
          return false
      end

      def draw?
        board.full? && !won?
      end 

      def over?
        won? || draw? || board.full?
      end 

      def winner
        WIN_COMBINATIONS.each do |win_combination|
          position_1 = self.board.cells[win_combination[0]]
          position_2 = self.board.cells[win_combination[1]]
          position_3 = self.board.cells[win_combination[2]]

          if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return "X"
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return "O"
          end 
        end 
          return nil
      end 

      def turn
        puts "Please enter your move: "
        @user_input = current_player.move(@board)
        if @board.valid_move?(@user_input)
          @board.update(@user_input, current_player)
        else
          puts "Please enter your move: "
          @board.display
          turn
        end 
        @board.display
      end 

      def play
        #turn
        # if !over?
        #   turn
        # else 
        #   over?
        # end 
        while !self.over?
          turn
        end 

          if self.winner == "X"
            puts "Congratulations X!"
            elsif self.winner == "O"
            puts "Congratulations O!"
            else 
            puts "Cat\'s Game!"
          end
      end 

      def start
        
      end 
      



end 