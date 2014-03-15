Feature: Scoring display
  As I tournament watcher
  I want to see scores in a nice format
  So that I don't need to count the scores myself

Background:
  Given there is a player with name "Jack"
  And there is a player with name "Jim"

Scenario: One and two points scored
  When "Jack" scores 1 point
  And "Jim" scores 2 points
  Then score display should read "15-30"
