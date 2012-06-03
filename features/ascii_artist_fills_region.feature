Feature: ASCII Artist bucket fills a region with a colour

  "F X Y C". Fill the region R with the colour C. R is defined as: Pixel (X,Y) belongs to R.
  Any other pixel which is the same colour as (X,Y) and shares a common side with any pixel
  in R also belongs to this region.
  
  "S" shows the canvas to the user

  As an ASCII Artist
  I want to bucket fill an area of a canvas

  Scenario: Bucket fill a region
    Given Picasso is running
    And I have a Canvas that has 10 columns and 10 rows
    When I enter the command "F 1 1 R"
    And I enter the command "S"
    Then all pixels on that canvas should be the colour "R"
    
  Scenario: Bucket fill a region where the canvas is split by a line
    Given Picasso is running
    And I have a Canvas that has 10 columns and 10 rows
    When I enter the command "V 5 1 10 C"
    And I enter the command "F 1 1 R"
    And I enter the command "S"
    Then the pixels "" should be the colour "R"
    
  Scenario: Bucket fill a region where the canvas is split into quarters by two lines
    Given Picasso is running
    And I have a Canvas that has 10 columns and 10 rows
    When I enter the command "V 5 1 10 C"
    When I enter the command "H 1 10 5 X"      
    And I enter the command "F 1 1 R"
    And I enter the command "S"
    Then the pixels "" should be the colour "R"
    
  Scenario: Bucket fill a region where the canvas is split into quarters by two lines and there is a pixel in the region we are filling
    Given Picasso is running
    And I have a Canvas that has 10 columns and 10 rows
    When I enter the command "V 5 1 10 C"
    And I enter the command "H 1 10 5 X"
    And I enter the command "L 2 2 Z"    
    And I enter the command "F 1 1 R"
    And I enter the command "S"
    Then the pixels "" should be the colour "R"

  Scenario: Bucket fill a region where the canvas is split into quarters by two lines and there is a diagonal line
    Given Picasso is running
    And I have a Canvas that has 10 columns and 10 rows
    When I enter the command "V 5 1 10 C"
    And I enter the command "H 1 10 5 X"
    And I enter the command "L 1 1 Z"
    And I enter the command "L 2 2 Z"    
    And I enter the command "L 3 3 Z"
    And I enter the command "L 4 4 Z"        
    And I enter the command "F 2 1 R"
    And I enter the command "S"
    Then the pixels "" should be the colour "R"
    
  Scenario: Draw a cross then bucket fill the cross
    Given Picasso is running
    And I have a Canvas that has 10 columns and 10 rows
    When I enter the command "V 5 2 9 X"
    And I enter the command "H 2 9 5 X"        
    And I enter the command "F 5 5 R"
    And I enter the command "S"
    Then the pixels "" should be the colour "R"

  Scenario Outline: Try to fill region that is out of bounds of the canvas
    Given Picasso is running
    And I have a Canvas that has 10 columns and 10 rows
    And I enter the command "F <X> <Y> R"
    Then I should see "Error: The pixel you tried to colour is out of range of the canvas"

    Scenarios:
    | X   | Y  |
    | -1  | 1  |
    | 1   | -1 |
    | -1  | -1 |    
    | 0   | 1  |
    | 1   | 0  |
    | 0   | 0  |
    | 11  | 1  |
    | 1   | 11 |
    | 11  | 11 |