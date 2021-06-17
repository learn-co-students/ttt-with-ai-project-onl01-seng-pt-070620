module Players
    class Computer < Player
        def move(board)
            if !board.full?
                best_move(board)
            end
        end

        def best_move(board)
            if !board.taken?(5)
                move = 5
            elsif board.turn_count == 1
                move = 1
            elsif board.turn_count == 2
                move = [1, 3, 7, 9].detect{|space| !board.taken?(space)}
            # elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
            #     move = 2
            else
                Game::WIN_COMBINATIONS.detect do |combo|
                    if combo.select{|space| board.position(space + 1) == token}.size == 2 && combo.any?{|space| board.position(space + 1) == " "}
                        move = combo.detect{|space| board.position(space + 1) == " "} + 1
                    elsif combo.select{|space| board.position(space + 1) != token && board.position(space + 1) != " "}.size == 2 && combo.any?{|space| board.position(space + 1) == " "}
                        move = combo.detect{|space| board.position(space + 1) == " "} + 1    
                    end
                end
                move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|space| !board.taken?(space)}
            end
            move
        end
    end
end
