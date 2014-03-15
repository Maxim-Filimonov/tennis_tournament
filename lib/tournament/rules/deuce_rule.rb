require 'tournament/rules/difference_rule_applicability'
module Tournament
  module Rules
    class DeuceRule
      attr_reader :scoreboard
      include DifferenceRuleApplicability

      def initialize(scoreboard)
        @scoreboard = scoreboard
      end


      def required_difference
        0
      end

      def display
        'Deuce'
      end
    end
  end
end
