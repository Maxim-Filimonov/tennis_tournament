require 'tournament/scoreboard'
require 'tournament/rules/generic_rule'
require 'tournament/rules/deuce_rule'
require 'tournament/rules/advantage_rule'
require 'tournament/rules/winner_rule'
module Tournament
  class Game
    extend Forwardable
    attr_reader :scoreboard
    attr_accessor :rules
    delegate :pointWonBy => :scoreboard
    def initialize(*players, scoreboard: ->(){ Tournament::Scoreboard.new(players) })
      @scoreboard = scoreboard.call
    end

    def score
      rule = rules.find {|rule| rule.applicable? }
      rule.display
    end

    def rules
      @rules ||= [
        Tournament::Rules::DeuceRule.new(scoreboard),
        Tournament::Rules::WinnerRule.new(scoreboard),
        Tournament::Rules::AdvantageRule.new(scoreboard),
        Tournament::Rules::GenericRule.new(scoreboard)
      ]
    end
  end
end
