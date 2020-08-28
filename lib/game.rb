
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
    puts "Make a move player #{current_player.token}."
    user_input = current_player.move(board)
    if !board.valid_move?(user_input)
      puts "Try again dude!"
      turn
    end
    board.update(user_input, current_player)
    # sleep(3)
    board.display
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
  
  def self.start 
    self.menu_options
  end
  
  def self.menu_options
    puts "Welcome! What type of game would you like to play?"
    puts "0 ---> Computer vs Computer"
    puts "1 ---> Player vs Computer"
    puts "2 ---> Player vs Player"
    
    user_input = gets.chomp
    
    if user_input == "0"
      game = Game.new
      puts "#{game.start_CvC}"
    elsif user_input == "1"
      game = Game.new
      puts "#{game.start_PvC}"
    elsif user_input == "2"
      game = Game.new
      puts "#{game.start_PvP}"
    else
      puts "You fool, leave this game!"
    end
    
  end

  def cells=(cells)
    Board.cells
  end
  
  def start_PvP 
    game = Game.new()
    game.board.display
    game.play
    game.play_again?
  end
  
  def start_PvC
    game = Game.new(Players::Human.new('X'), Players::Computer.new('O'))
    game.board.display
    game.play
    game.play_again?
  end
  
  def start_CvC
    game = Game.new(Players::Computer.new('X'), Players::Computer.new('O'))
    game.board.display
    game.play
    game.play_again?
  end
  
  def play_again?
    puts "Play again?"
    input = gets.strip
    if input.downcase == 'y'
      puts "Welcome! What type of game would you like to play?"
    puts "0 ---> Computer vs Computer"
    puts "1 ---> Player vs Computer"
    puts "2 ---> Player vs Player"
    
    user_input = gets.chomp
    
    if user_input == "0"
      game = Game.new
      puts "#{game.start_CvC}"
    elsif user_input == "1"
      game = Game.new
      puts "#{game.start_PvC}"
    elsif user_input == "2"
      game = Game.new
      puts "#{game.start_PvP}"
    else
      puts "You fool, leave this game!"
    end
    elsif input.downcase == 'n'
      puts "Thanks for playing!" 
    end
  end
end

  