module Players
  class Human < Player
    def move(board, game = nil)
      sleep 0.5
      puts 'Select a number 1-9'
      response = gets.strip
    end
  end
end