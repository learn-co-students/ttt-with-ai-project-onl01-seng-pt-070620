module Players
    class Computer < Player

        def move(board)
            if !board.taken?(1)
                puts "1"
            elsif !board.taken?(1)
                puts "2"
            end 
        end 

    end 

end 