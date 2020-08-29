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

        @board.display

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
        puts ""
        puts "---------------------------"
        puts "Welcome to Tic Tac Toe game!"
        puts "---------------------------"
        puts ""
        menu
      end 

      def menu
          puts ""
          puts "--------------------------------------------"
          puts "How would you like to play?"
          puts "For a list of options, please enter 'help'."
          puts "--------------------------------------------"
          puts ""

          input = ''

          while input != 'exit' do

            input = gets.chomp.strip
              if input == "help"
                help

                # user chooses to play the computer
              elsif input == "1"
                puts "Do you want to move first? [y/n]"
                  if gets.strip == "y"
                    Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
                  else # computer takes the first move
                    Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
                  end
                # end of the game
                puts "The game is over. To play another game, enter 'menu'. To quit, enter 'quit'."
                  input = ''
                    while input != 'exit' do
                      input = gets.strip
                    if input == "menu"
                      @board.reset!
                      menu
                    elsif input == "quit"
                      exit
                    end 
                end 
                # user chooses to play with anohter human

              elsif input == "2"
                puts "Do you want to move first? [y/n]"
                  if gets.strip == "y"
                    Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
                  else # computer takes the first move
                    Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
                  end
                # end of the game
                puts "The game is over. To play another game, enter 'menu'. To quit, enter 'quit'."
                input = ''
                  while input != 'exit' do
                    input = gets.strip
                  if input == "menu"
                    @board.reset!
                    menu
                  elsif input == "quit"
                    exit
                  end 
                end 

              elsif input == "0"
                # user chooses computer to play with itself
                    Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
                # end of the game
                puts "The game is over. To play another game, enter 'menu'. To quit, enter 'quit'."
                  input = ''
                    while input != 'exit' do
                      input = gets.strip
                    if input == "menu"
                      @board.reset!
                      menu
                    elsif input == "quit"
                      exit
                    end 
                  end 
              elsif input == "quit"
                exit
              else
                puts "invaid input. Please enter again. "
              end 
          end 
      end 
      
      def help
        puts "Please choose a game mode: "
        puts "type '1' to play with the computer. "
        puts "type '2' to play with another human. "
        puts "type '0' to have the computer plays itself. "
      end 



end 