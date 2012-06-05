Feature: ASCII Artist quits Picasso

  As an ASCII Artist
  When I get bored
  I want to quit Picasso

  Scenario: Quit Picasso
  
  Given Picasso is running
  When I enter the command "X"
  Then I should see "Goodbye!"