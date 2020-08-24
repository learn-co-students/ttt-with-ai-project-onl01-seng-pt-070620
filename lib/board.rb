

class Board 
    attr_accessor :cells

    def initialize 
      reset!
    end

    def reset!
      @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(user_input)
      cells[user_input.to_i - 1]
    end

    def full?
      cells.all? {|x| x != " "}
    end

    def turn_count
      cells.count {|x| x != " "}
    end

    def taken?(position)
      cells[position.to_i - 1] == "X" || cells[position.to_i - 1] == "O"
    end

    def valid_move?(position)
      !taken?(position)  && (0..8).include?(position.to_i - 1)
    end

    #update updates the cells in the board with the player token according to the input


    def update(position, player)
        cells[position.to_i - 1] = player.token
    end

end