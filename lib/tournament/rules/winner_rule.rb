require 'tournament/rules/difference_rule_applicability'
module Tournament
  module Rules
    class WinnerRule
      attr_reader :scoreboard
      include DifferenceRuleApplicability

      def initialize(scoreboard)
        @scoreboard = scoreboard
      end

      def required_difference
        2
      end

      def display
        highest_scorer = scoreboard.scores.max_by { |_, v| v }[0]
        "#{highest_scorer} wins"
      end
    end
  end
end
