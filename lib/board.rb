class Board
    attr_accessor :cells
    # using instance variable to store object board values
    @cells = []

    def reset!
        self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ", ]
    end 

    def initialize
        self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " ", ]
    end 

    def display
        # using display method to return @cells values per index
        # tried using puts "@cells..."
        # tried using puts "cells[]"
        # tried using return 
        # pry: @cells[] = nil [] is undefined
        # how to output board.display? 
        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
        puts "-----------"
        puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
        puts "-----------"
        puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end 

    def position(user_input)
        self.cells[user_input.to_i - 1]
    end 

    def full?
        self.cells.all? {|i| i != " "}
    end 

    def turn_count
        turns = 0
        self.cells.each do |element|
          if element == "X" || element == "O"
          turns += 1
          end
        end
      turns
    end 

    def taken?(num)
        if self.position(num) == " " || self.position(num) == "" || self.position(num) == nil
            return false
          end
          if self.position(num) == "X" || self.position(num) == "O"
            return true
          end
    end 

    def valid_move?(num)
        if !self.taken?(num) && num.to_i.to_s == num #&& num.between?(0, 8)
            return true
          else
           false
          end
    end 

    def update(move, player)
        self.cells[move.to_i - 1] = player.token
    end 

    
end 