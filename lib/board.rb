require 'pry'
class Board
  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    i = 0
    while i < 9 do
      #binding.pry
      puts " #{cells[i]} | #{cells[i+1]} | #{cells[i+2]} "
      if i < 6
        puts "-----------"
      end
      i +=3
    end
  end

  def position(input)
    input = input.to_i
    cells[input-1]
  end

  def full?
    cells.all? {|position| position=="X"||position=="O"}
  end

  def turn_count
    turn=0
    cells.each {|position| turn+=1 if position != " "}
    turn
  end

  def taken?(position)
    position = position.to_i
    cells[position-1]=="X" || cells[position-1]=="O"
  end

  def valid_move?(position)
    position = position.to_i
    position.between?(1,9) && !taken?(position)
  end

  def update(token,player)
    #binding.pry
    token=token.to_i
    cells[token-1]=player.token
  end





end
