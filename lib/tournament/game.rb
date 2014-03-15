require 'tournament/scoreboard'
require 'tournament/rules/generic_rule'
require 'tournament/rules/deuce_rule'
require 'tournament/rules/advantage_rule'
require 'tournament/rules/winner_rule'
module Tournament
  class Game
    extend Forwardable
    attr_reader :scoreboard
    attr_reader :rules
    delegate :pointWonBy => :scoreboard
    def initialize(*players,
      scoreboard: ->(){ Tournament::Scoreboard.new(players) },
      rules: -> (scores) { [
                            Tournament::Rules::DeuceRule.new(scores),
                            Tournament::Rules::WinnerRule.new(scores),
                            Tournament::Rules::AdvantageRule.new(scores),
                            Tournament::Rules::GenericRule.new(scores)] })
      @scoreboard = scoreboard.call
      @rules = rules.call(@scoreboard)
    end

    def score
      rule = rules.find {|rule| rule.applicable? }
      rule.display
    end
  end
end
