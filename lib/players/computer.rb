require 'pry'
module Players
  class Computer < Player
    def move(board, game = nil)
      if board.empty_cells.count == 9
        move = 5 # rand(0..8) will work but then computer vs computer won't always end in a draw
        # I think that's because our minmax doesn't rate importance of moves, like if ai can win in the next move
        # guaranteed, it sometimes won't make that move. It'll make a move that sets itself up so it can't lose aka it traps you
        # instead of just taking the garaunteed win. Maybe this can be fixed through taking depth into account in eval
        # we can rate the importance of 2 winning moves by tracking which iteration of recursion its on (depth)
        # TODO: Implement better evaluation of all endstates throughout recursion trees by tracking depth
        return move
      end
      move = minimax(game, board, board.turn_count + 1, token) # call minimax on CURRENT player token
      move[0] + 1
      # sleep 1
    end

    def minimax(game, state, turn, current_player)
      best = if current_player == token
               [-1, -1.0 / 0.0]
             else
               [-1, +1.0 / 0.0]
             end
      if game.over? || game.draw?
        score = game.eval
        return [-1, score]
      end
      state.empty_cells.each do |cell|
        state.cells[cell] = current_player
        # state.display
        # puts "Turn #{turn}, current player #{current_player}, best #{best}"
        # gets
        score = minimax(game, state, turn + 1, current_player == 'X' ? 'O' : 'X') # recursive call
        state.cells[cell] = ' '
        score[0] = cell
        if current_player == token
          best = score if score[1] > best[1]
        else
          best = score if score[1] < best[1]
        end
      end

      best
    end
  end
end
