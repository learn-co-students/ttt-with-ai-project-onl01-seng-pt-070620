require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [6, 4, 2]
  ].freeze

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1 # each new instance of game needs 2 player objects stored in this game instance variables and a
    # board instance if no args given default both objects to new player::humans
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2 # calls current board instance method turn.count if number is even
    # 'O' just went its X's turn does opposite if false
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.taken?(combo[0] + 1) && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
    end
  end

  def winner
    if (combo = won?)
      @board.cells[combo[0]]
    else
      nil
    end
  end

  def turn
    @board.display
    player = current_player
    current_move = player.move(@board) # checks if move is valid places move then repeats with opposite player
    @board.valid_move?(current_move) ? @board.update(current_move, player) : turn
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end
