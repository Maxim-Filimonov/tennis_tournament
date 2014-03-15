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
      player_score = scores[player]
      unless player_score
        raise "#{player} is not found. Available players are #{scores.map {|k,_| k}.join(",")}"
      end
      scores[player] += 1
    end
  end
end
