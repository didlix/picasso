Feature: ASCII Artist creates a Canvas in Picasso

  The command "C" creates a canvas and expects 2 parameters, the number 
  of columns and the number of rows. There can not be more than 250 columns
  or rows. A blank pixel is represented by a "O".
  
  "S" shows the canvas to the user

  As an ASCII Artist
  I want to create a canvas in Picasso
  So that I can draw an ascii image

  Scenario: Create Canvas
  
  Given Picasso is running
  When I enter the command "C 250 250"
  And I enter the command "S"
  Then I should see a canvas with 250 columns and 250 rows 
  And all pixels on that canvas should be "O"