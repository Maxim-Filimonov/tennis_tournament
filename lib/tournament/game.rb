module Tournament
  class Game
    attr_reader :players
    def initialize(players)
      @players = players
      @scores = {}
      @players.each do |player|
        @scores[player] = 0
      end
    end

    def pointWonBy(player)
      @scores[player] += 1
    end

    def score
      @scores.map do |score|
        case score[1]
        when 1 then "15"
        when 2 then "30"
        end
      end.join("-")
    end
  end
end
