Feature: ASCII Artist starts Picasso

  As an ASCII Artist
  I want to start Picasso
  So that I can draw an ascii image

  Scenario: Start Picasso
  
  Given Picasso is not yet running
  When I start Picasso
  Then I should see "Welcome to Picasso!"
  And I should see "Enter command:"