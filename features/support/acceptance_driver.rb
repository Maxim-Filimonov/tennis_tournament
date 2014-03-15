module AcceptanceDriver
  def players
    @players ||= []
  end
  def game
    @game ||= Game.new(@players)
  end
  def add_player(name)
    players << name
  end
  def add_point_for(player)
    game.pointWonBy(player)
  end
  def score_display
    game.score()
  end
end
World(AcceptanceDriver)

class Game
  def initialize(players)

  end

  def pointWonBy(player)

  end

  def score

  end
end
