module Players
  class Human < Player
    def move(board)
      puts 'Select a number 1-9'
      response = gets.strip
    end
  end
end