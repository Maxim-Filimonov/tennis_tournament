module Tournament
  module Rules
    class WinnerRule
      attr_reader :scoreboard

      def initialize(scoreboard)
        @scoreboard = scoreboard
      end

      def applicable?
        values = scoreboard.scores.map {|_,v| v}
        return false if values.inject(:+) < 6
        highest_score = values.max
        next_highest_score = values.reject{|v| v == highest_score}.max
        score_difference = highest_score - next_highest_score
        score_difference == 2
      end

      def display
        highest_scorer = scoreboard.scores.max_by { |_, v| v }[0]
        "#{highest_scorer} wins"
      end
    end
  end
end
