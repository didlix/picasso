Feature: ASCII Artist starts Picasso

  As an ASCII Artist
  I want to start Picasso
  So that I can draw an ascii image

  Scenario: Start Picasso
  
  Given Picasso is not yet running
  When I start Picasso
  Then I should see "Welcome to Picasso!"
  And I should see "Enter command:"
  

  # Scenario: draw a vertical line
  #    Given I do not yet have a canvas
  #    When I create a new canvas with the command "I 3 3"
  #    And I enter the command "V 2 1 3 C"
  #    And I enter the command "S"
  #    Then I should see:
  #      "0C0
  #      0C0
  #      0C0"
  #  Scenario: draw horizontal line
  #    Given I do not yet have a canvas
  #    When I create a new canvas with the command "I 3 3"
  #    And I enter the command "H 2 1 3 C"
  #    And I enter the command "S"
  #    Then I should see:
  #      000
  #      CCC
  #      000
  #  Scenario: too many rows
  #    Given I do not yet have a canvas
  #    When I create a new canvas with the command "I 1 251"
  #    Then I should see "You can not have more than 250 rows"
  #  Scenario: too many columns
  #    Given I do not yet have a canvas
  #    When I create a new canvas with the command "I 251 1"
  #    Then I should see "You can not have more than 250 columns"