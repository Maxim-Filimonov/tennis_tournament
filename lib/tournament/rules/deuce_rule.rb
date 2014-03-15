module Tournament
  module Rules
    class DeuceRule
      attr_reader :scoreboard

      def initialize(scoreboard)
        @scoreboard = scoreboard
      end

      def applicable?
        values = scoreboard.scores.map {|k,v| v}
        uniq_value = values.uniq
        scored_the_same = uniq_value.length == 1
        result = false
        result = uniq_value.first >= 3 if scored_the_same
        result
      end

      def display
        'Deuce'
      end
    end
  end
end
