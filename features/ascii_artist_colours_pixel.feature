Feature: ASCII Artist colours a pixel in Picasso
  The command "L" creates a canvas and expects 3 parameters, the pixel's horizontal (X)
  position, its vertical position (Y) and the colour of the pixel (C)

  As an ASCII Artist
  I want to colour specific pixels
  So that I can draw my image

  Scenario Outline: Colour pixels
    Given Picasso is running
    And I have a Canvas that has 10 columns and 10 rows
    When I colour a pixel with the command "L <X> <Y> <C>"
    And I enter the command "S"
    Then I should see a canvas with a pixel in location <X>, <Y> that is the colour "<C>"

    Scenarios: Pixels of valid colours in range of the canvas
      | X  | Y  | C |
      | 1  | 10 | C |
      | 1  | 2  | D |
      | 1  | 1  | G |
      | 10 | 10 | F |
      | 8  | 8  | A |
      | 9  | 1  | B |
      | 2  | 2  | E |



  # Scenario Outline: Attempt to colour a pixel out of range of the canvas
  #   Given Picasso is running
  #   And I have a Canvas that has 10 columns and 10 rows
  #   When I colour a pixel with the command "L <X> <Y> <C>"
  #   Then I should see "Error: The pixel you tried to colour is out of range of the canvas"
  #   
  #     Scenarios: Drawing pixels out of range
  #       | X  | Y  | C |
  #       | -1 | 9  | A |
  #       | 11 | 1  | B |
  #       | 0  | 9  | C |
  #       | 9  | -1 | A |
  #       | 1  | 11 | B |
  #       | 9  | 0  | C |
  #       | -1 | -1 | A |
  #       | 11 | 11 | B |
  #       | 0  | 0  | C |
  # 
  # Scenario Outline: Attempt to draw a pixel with an invalid colour
  #   Given Picasso is running
  #   And I have a Canvas that has 10 columns and 10 rows
  #   When I colour a pixel with the command "L <X> <Y> <C>"
  #   Then I should see "Error: That is not a valid colour, valid colours are A-Z"
  # 
  #     Scenarios: Invalid colours
  #       | X | Y | C |
  #       | 1 | 1 | 1 |
  #       | 1 | 1 | - |
  #       
  # 
