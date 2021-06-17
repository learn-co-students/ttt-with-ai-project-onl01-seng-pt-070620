module Players
    class Human < Player
        def move(board)
            puts "Please input move"
            cell = gets.strip
            cell
        end
    end
end