Given(/^there is a player with name "([^"]*)"$/) do |name|
  add_player(name)
end


When(/^"([^"]*)" scores (\d+) point(?:s?)$/) do |player, score|
  (1..score.to_i).each do |point|
    add_point_for(player)
  end
end

Then(/^score display should read "([^"]*)"$/) do |expected_score_display|
  score_display.should eq(expected_score_display)
end
