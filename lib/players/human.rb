module Players

    class Human < Player


        def move(board)

            puts "What space would you like to mark with your token?"
            gets.chomp

        end
    end
end