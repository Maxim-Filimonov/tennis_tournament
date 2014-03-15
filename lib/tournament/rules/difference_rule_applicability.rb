module Tournament
  module Rules
    module DifferenceRuleApplicability
      def applicable?
        values = scoreboard.scores.map {|_,v| v}
        return false if values.inject(:+) < 6
        highest_score = values.max
        lame_scores = values.reject { |v| v == highest_score }
        next_highest_score = lame_scores.empty? ? [highest_score] : lame_scores
        score_difference = highest_score - next_highest_score.max
        score_difference == required_difference
      end
    end
  end
end
