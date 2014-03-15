module Tournament
  class Scoreboard
    attr_reader :scores

    def initialize(players)
      @scores = {}
      players.each do |player|
        @scores[player] = 0
      end
    end

    def pointWonBy(player)
      scores[player] += 1
    end
  end
end
