module Tournament
  module Rules
    module DifferenceRuleApplicability
      def applicable?
        values = scoreboard.scores.map {|_,v| v}
        if all_scored_more_than_3?(values)
          score_difference(values) == required_difference
        else
          false
        end
      end


      private
      def score_difference(score_values)
        highest_score = score_values.max
        lame_scores = score_values.reject { |v| v == highest_score }
        next_highest_score = lame_scores.empty? ? [highest_score] : lame_scores
        highest_score - next_highest_score.max
      end

      def all_scored_more_than_3?(score_values)
        score_values.inject(:+) >= score_values.length * 3
      end
    end
  end
end
