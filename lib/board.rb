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
    @cells[user_input.to_i - 1]
  end
  
  def full?
     @cells.all?{|square| square != " " }
  end
  
  def turn_count
    @cells.count{|square| square != " " }
  end
  
  def taken?(index)
    if @cells[index.to_i - 1] != " "
      true
    else
      false
    end  
  end
  
  def valid_move?(position)
    !taken?(position) && position.to_i >0 && position.to_i <=9
  end
  
  def update(position, player)
      self.cells[position.to_i-1] = player.token
  end
  
  
end  