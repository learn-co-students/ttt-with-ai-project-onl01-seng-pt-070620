require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :cells
  
  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  WIN_COMBINATIONS = [[0, 1, 2], #top row across
                      [3, 4, 5], #middle row across
                      [6, 7, 8], #bottom row across
                      [0, 3, 6], 
                      [1, 4, 7],
                      [2, 5, 8],
                      [0, 4, 8],
                      [2, 4, 6]]
                      
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
  
  def won?
    WIN_COMBINATIONS.each do |win|
      # binding.pry
      if @board.cells[win[0]] == @board.cells[win[1]] && @board.cells[win[1]] == @board.cells[win[2]] && @board.cells[win[0]] != " "
        @winner_token = @board.cells[win[0]]
        return win
      end
    end
    return false
  end
  
  def draw?
    # binding.pry
    if !won? && !@board.cells.include?(" ")
      return true
    else
      return false
    end
  end
  
  def over?
    draw? || won? ? true : false
  end
  
  def winner
    if over?
      if @winner_token == " "
        return nil
      end
      @winner_token
    end
  end
  
  def turn 
    user_input = current_player.move(board)
    if !board.valid_move?(user_input)
      turn
    end
    board.update(user_input, current_player)
  end
  
  def play
    turn until over?
    if over?
      if draw?
        puts "Cat's Game!"
      elsif won?
        puts "Congratulations #{@winner_token}!"
      end
    end
  end
  
  def cells=(cells)
    Board.cells
    binding.pry
  end
  
end