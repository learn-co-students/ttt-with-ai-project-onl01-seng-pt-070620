require 'pry'
module Players
  class Computer < Player
    def move(board, game = nil)
      move = minimax(game, board, 9,game.current_player.token)
      puts "Computer attempting to move to cell #{move[0]+ 1}"
      move[0] + 1
    end

    def minimax(game, state,depth, player)
      if player == 'O'
        best = [-1, -1.0/0.0]
      else
        best = [-1, +1.0/0.0]
      end
      if depth.zero? || game.over?
        score = game.eval
        return [-1, score]
      end
      state.empty_cells.each do |cell|
        x = cell
        state.cells[x] = player
        score = minimax(game, state, depth - 1, game.current_player.token)
        state.cells[x] = ' '
        score[0] = x
        if player == 'O'
          if score[1] > best[1]
            best = score
          end
        else
          if score[1] < best[1]
            best = score
          end
        end

      end

      best
    end





  end
end