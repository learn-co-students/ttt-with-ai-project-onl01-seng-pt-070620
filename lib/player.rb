class Player
  attr_reader :token
  @@all = []
  def initialize(token)
    @token = token
    self.class.all << self
  end

  def move
    #Board.update(playersMove,self)
  end
  def self.all
    @@all
  end
end