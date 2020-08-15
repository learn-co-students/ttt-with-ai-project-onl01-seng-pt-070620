class Game
  attr_accessor :board, :player_1, :player_2, :user_input
  
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def start 
    puts "Press '0' for a Computer vs Computer game, Press '1' for a Computer vs Player game, or Press '2' for a two player game."
    player_input = gets.strip
    if player_input == "0"
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"), board = Board.new).play
    elsif player_input == "1"
      puts "If you would like to go first type 'y', if not type 'n'."
      if gets.strip == "y"
        Game.new(Players::Human.new("X"), Players::Computer.new("O"), board = Board.new).play 
      else
        Game.new(Players::Computer.new("X"), Players::Human.new("O"), board = Board.new).play
      end
    else player_input == "2"
      Game.new(Players::Human.new("X"), Players::Human.new("O"), board = Board.new).play
    end
    puts "Care for another round? 'y' or 'n'?"
      if gets.strip == "y"
        start
      else gets.strip == "n"
        puts "Thanks for playing!"
      end
  end
  
  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] &&
      (@board.cells[combo[0]] == "X" || @board.cells[combo[0]] == "O")
    end
  end
  
  def draw?
    @board.full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if combo = won?
      @board.cells[combo[0]]
    end
  end
  
  def turn
    puts "Please enter a number (1-9):"
    @user_input = current_player.move(board)
      if @board.valid_move?(user_input)
        @board.update(user_input, current_player)
      else
        puts "Invalid move, please choose again:"
        turn
      end
  end
  
  def play 
    turn until over?
    puts "Congratulations #{winner}!"
      if draw?
        puts "Cat's Game!"
      end
  end

end