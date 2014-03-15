require 'tournament/rules/difference_rule_applicability'
module Tournament
  module Rules
    class AdvantageRule
      attr_reader :scoreboard
      include DifferenceRuleApplicability

      def initialize(scoreboard)
        @scoreboard = scoreboard
      end

      def required_difference
        1
      end

      def display
        highest_scorer = scoreboard.scores.max_by { |k, v| v }[0]
        "Advantage #{highest_scorer}"
      end
    end
  end
end
