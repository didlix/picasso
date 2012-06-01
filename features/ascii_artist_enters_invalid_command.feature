Feature: An ASCII Artist gets an error when they try to use invalid commands

  As an ASCII Artist
  I want to see an error message when I enter an invalid command
  So that I know I did something wrong

  Scenario Outline: Enter invalid command
    Given Picasso is running
    And I have a Canvas that has 10 columns and 10 rows
    When I enter the command "<command>"
    Then I should see "The command you entered is not valid"
    
    Scenarios: Invalid commands
      | command  |
      | fubar    |
      | foo      |
      | bar      |
      | SS       |