class Game 
  
  attr_accessor :board, :player_1, :player_2
  
       WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]
    
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @board = board 
      @player_1 = player_1
      @player_2 = player_2
    end 
    
    def current_player
      @board.turn_count % 2 == 0 ? player_1 : player_2
    end 
    
    def over?
       won? || full? || draw?
    end 
    
    def won?
        WIN_COMBINATIONS.detect do |win_combo|
    if (@board.cells[win_combo[0]]) == "X" && (@board.cells[win_combo[1]]) == "X" && (@board.cells[win_combo[2]]) == "X"
      return win_combo
    elsif (@board.cells[win_combo[0]]) == "O" && (@board.cells[win_combo[1]]) == "O" && (@board.cells[win_combo[2]]) == "O"
      return win_combo
    end
      false
  end
    end 
    
    def draw? 
      @board.full? && !won?
    end 
    
    def winner
      if winning_combo = won?
        @winner = @board.cells[winning_combo.first]
    end 
  end 
  
  def over?
     won? || draw?
  end 
  
  def turn 
    puts "Please enter 1-9:"
    @user_input = current_player.move(@board)
    if @board.valid_move?(@user_input)
      @board.update(@user_input, current_player)
    else puts "Please enter a number 1-9:"
      @board.display
      turn
    end
    @board.display
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