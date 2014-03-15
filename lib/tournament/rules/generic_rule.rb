module Tournament
  module Rules
    class GenericRule
      attr_reader :scoreboard

      def initialize(scoreboard)
        @scoreboard = scoreboard
      end

      def apply?()
        true
      end

      def display
        scoreboard.scores.map do |_, value|
          if score_map[value]
            score_map[value]
          else
            "invalid score"
          end
        end.join("-")
      end

      def score_map
        {0 => '0', 1 => '15', 2 => '30', 3 => '40'}
      end
    end
  end
end