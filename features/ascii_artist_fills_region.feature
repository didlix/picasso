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
    When I draw a line with the command "V 1 10 5 C"
    And I enter the command "F 1 1 R"
    And I enter the command "S"
    Then all pixels on that canvas should be the colour "R"