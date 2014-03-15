Feature: Scoring display
  As I tournament watcher
  I want to see scores in a nice format
  So that I don't need to count the scores myself

Background:
  Given there is a player with name "Jack"
  And there is a player with name "David"

Scenario: One and two points scored
  When "Jack" scores 1 point
  And "David" scores 2 points
  Then score display should read "15-30"

Scenario: Two and three points scored
  When "Jack" scores 2 point
  And "David" scores 3 points
  Then score display should read "30-40"

Scenario: Deuce - equal scores after 3 point scored by each
  When "Jack" scores 3 point
  And "David" scores 3 points
  Then score display should read "Deuce"

Scenario: Advantage - one point advantage after 3 point scored by each
    When "Jack" scores 4 point
    And "David" scores 3 points
    Then score display should read "Advantage Jack"
