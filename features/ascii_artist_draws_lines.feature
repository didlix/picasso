Feature: ASCII Artist draws lines on the canvas

Commands:
  V = Vertical, H = Horizontal
  Y1/2 = Y co-ordinates, this is a range
  X1/2 = X co-ordinates, this is a range
  C = Colour
  V X Y1 Y2 C. Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
  H X1 X2 Y C. Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).


  As an ASCII Artist
  I want to draw lines on my canvas
  
  Scenario Outline: Draw Horizontal Lines
    Given Picasso is running
    And I have a Canvas that has 10 columns and 10 rows
    When I enter the command "H <X1> <X2> <Y> <C>"
    And I enter the command "S"
    Then I should see a canvas with a line between <X1> and <X2> on row <Y> that is the colour "<C>"

    Scenarios: Pixels of valid colours in range of the canvas
      | X1 | X2 | Y  | C |
      | 1  | 10 | 8  | A |
      | 5  | 10 | 1  | B |
      | 2  | 8  | 10 | C |
      | 2  | 8  | 1  | D |
      
  Scenario Outline: Draw Vertical Lines
    Given Picasso is running
    And I have a Canvas that has 10 columns and 10 rows
    When I enter the command "V <X> <Y1> <Y2> <C>"
    And I enter the command "S"
    Then I should see a canvas with a line between <Y1> and <Y2> in column <X> that is the colour "<C>"

    Scenarios: Pixels of valid colours in range of the canvas
      | Y1 | Y2 | X  | C |
      | 1  | 10 | 8  | A |
      | 5  | 10 | 1  | B |
      | 2  | 8  | 10 | C |
      | 2  | 8  | 1  | D |      