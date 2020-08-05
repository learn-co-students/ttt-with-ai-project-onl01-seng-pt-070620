class Player
  attr_reader :token
  def initialize(token)
    @token = token
  end

  def move
    Board.update(playersMove,self)
  end
end