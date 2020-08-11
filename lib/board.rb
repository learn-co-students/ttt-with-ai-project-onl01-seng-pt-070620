class Board
    attr_accessor :cells
    @cells = []

    def reset!
        self.cells = Array.new(9, " ")
    end

    def initialize
        self.cells = Array.new(9, " ")
    end

    def display
        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
        puts "-----------"
        puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
        puts "-----------"
        puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def position(user_input)
        user_input = user_input.to_i
        self.cells[user_input - 1]
    end

    def full?
        self.cells.all? { |tok| tok == "X" || tok == "O" }
    end

    def turn_count
        self.cells.count { |tok| tok == 'X' || tok == 'O' }
    end

    def taken?(input)
        if self.cells[input.to_i - 1] == "X" || self.cells[input.to_i - 1] == "O"
            true
        else 
            false
        end
    end

    def valid_move?(user_input)
        user_input.to_i >0 && user_input.to_i <=9 && !taken?(user_input)
    end

    def update(user_input, current_player)
        user_input = user_input.to_i
        cells[user_input -1] = current_player.token
    end
end