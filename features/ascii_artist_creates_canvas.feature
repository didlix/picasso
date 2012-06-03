Feature: ASCII Artist creates a Canvas in Picasso

  The command "I" creates a canvas and expects 2 parameters, the number 
  of columns and the number of rows. There can not be more than 250 columns
  or rows. A blank pixel is represented by a "O".
  
  "S" shows the canvas to the user

  As an ASCII Artist
  I want to create a canvas in Picasso
  So that I can draw an ascii image

  Scenario Outline: Create Canvas Between 250
    Given Picasso is running
    When I enter the command "I <columns> <rows>"
    And I enter the command "S"
    Then I should see a canvas with <columns> columns and <rows> rows
    And all pixels on that canvas should be the colour "O"

    Scenarios: Valid canvas sizes
      | columns | rows |
      | 8       | 8    |
      | 1       | 1    |
      | 1       | 250  |    
      | 1       | 250  |
    
  Scenario Outline: Create canvas with either too few or too many rows/columns
    Given Picasso is running
    When I enter the command "I <columns> <rows>"
    Then I should see "Error: Your canvas size is out of bounds"
  
    Scenarios: Too many columns
      | columns | rows |
      | 251     | 1    |
  
    Scenarios: Too few columns
      | columns | rows |
      | 0       | 1    |
      | -1      | 1    |    
  
    Scenarios: Too many rows
      | columns | rows |
      | 1       | 251  |
  
    Scenarios: Too few rows
      | columns | rows |
      | 1       | 0    |
      | 1       | -1   |
    
    Scenarios: Too few rows and columns
      | columns | rows |
      | 0       | 0    |
  
    Scenarios: Too many rows and columns
      | columns | rows |
      | 251     | 251  |
    