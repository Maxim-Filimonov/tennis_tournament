require 'tournament/scoreboard'
require 'tournament/rules/generic_rule'
module Tournament
  class Game
    extend Forwardable
    attr_reader :scoreboard
    attr_reader :rules
    delegate :pointWonBy => :scoreboard
    def initialize(*players,
      scoreboard: ->(){ Tournament::Scoreboard.new(players) },
      rules: -> (scores) { [Tournament::Rules::GenericRule.new(scores)] })
      @scoreboard = scoreboard.call
      @rules = rules.call(@scoreboard)
    end

    def score
      rule = rules.find {|rule| rule.apply? }
      rule.display
    end
  end
end
