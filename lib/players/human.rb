module Players
  class Human < Player
    
    def move(board) #instance of Board.new
      puts "Please enter 1-9:"
      gets.strip
    end
  end
  
end