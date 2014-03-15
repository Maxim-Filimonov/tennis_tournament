Description
===
This is a test exercise to help practice tdd and design.

The exercise is scoring system for tennis with following rules:

* A game is won by the first player to have won at least four points in total and at least two points more than the opponent.

* The running score of each game is described in a manner peculiar to tennis: scores from zero to three points are described as 0, 15, 30, 40, respectively

* If at least three points have been scored by each player, and the scores are equal, the score is "deuce".

* If at least three points have been scored by each side and a player has one more point than his opponent, the score of the game is "advantage" for the player in the lead.


Run tests
===
```bash
bundle install
rspec
cucumber
```

Play
===
```ruby
  irb> require './lib/tournament/game'
  irb> game = Tournament::Game.new('player 1', 'player 2')
  irb> game.pointWonBy('player 1')
  irb> game.pointWonBy('player 2')
  irb> game.score
  => "15-15"
  irb> game.pointWonBy('player 1')
  irb> game.pointWonBy('player 1')
  irb> game.score
  => "40-15"
  irb> game.pointWonBy('player 2')
  irb> game.pointWonBy('player 2')
  irb> game.score
  => "Deuce"
  irb> game.pointWonBy('player 1')
  irb> game.score
  => "Advantage player 1"
  irb> game.pointWonBy('player 1')
  irb> game.score
  => "player 1 wins"
```
