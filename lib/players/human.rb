module Players
    class Human < Player
        def move(board)
            puts "Please input move"
            gets.strip
        end
    end
end