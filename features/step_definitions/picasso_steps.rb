# Acts as a test double so that we can check stuff normally sent to cuc
class Output
  def messages
    @messages ||= []
  end
  
  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end

Given /^Picasso is not yet running$/ do
end

When /^I start Picasso$/ do
  picasso = Picasso::App.new(output)
  picasso.start
end

Then /^I should see "([^"]*)"$/ do |message|
  output.messages.should include(message)
end

Given /^Picasso is running$/ do
  @picasso = Picasso::App.new(output)
  @picasso.start
end

When /^I enter the command "([^"]*)"$/ do |command|
  @picasso.command(command)

  errors = output.messages.each.select {|x| x =~ /Error/ }
  if errors.count > 0
    exit
  end  
end

Then /^I should see a canvas with (\d+) columns and (\d+) rows$/ do |cols, rows|
  canvas = output.messages.each.select {|x| x =~ /^[A-Z]+$/ }
  
  # check rows of canvas
  canvas.count.should == rows.to_i

  # check cols of canvas
  canvas.each do |row|
    row.length.should == cols.to_i
  end
  
  # and check total number of pixels is expected
  number_of_expected_pixels = cols.to_i * rows.to_i
  canvas.join('').length.should == number_of_expected_pixels
end

Then /^all pixels on that canvas should be the colour "([^"]*)"$/ do |pixel|
  canvas = output.messages.each.select {|x| x =~ /^[A-Z]+$/ }
puts output.messages
puts pixel
  canvas.each do |row|
    puts row
    /^#{pixel}+$/.match row
  end
end

Given /^I have a Canvas that has (\d+) columns and (\d+) rows$/ do |cols, rows|
  @picasso.command("I #{cols} #{rows}")
end

Then /^I should see a canvas with a pixel in location (\d+), (\d+) that is the colour "([^"]*)"$/ do |x, y, colour|
  canvas = output.messages.select {|line| line =~ /^[A-Z]+$/ }
  painted_pixel = canvas[y.to_i-1][x.to_i-1]
  painted_pixel.should == colour  
end

Then /^I should see a canvas with a line between (\d+) and (\d+) on row (\d+) that is the colour "(.*?)"$/ do |x1, x2, y, colour|
  canvas = output.messages.select {|line| line =~ /^[A-Z]+$/ }

  x1 = x1.to_i-1
  x2 = x2.to_i-1
  y = y.to_i-1
  
  for x in x1..x2
    canvas[y][x].should == colour
  end
end

Then /^I should see a canvas with a line between (\d+) and (\d+) in column (\d+) that is the colour "(.*?)"$/ do |y1, y2, x, colour|
  canvas = output.messages.select {|line| line =~ /^[A-Z]+$/ }

  y1 = y1.to_i-1
  y2 = y2.to_i-1
  x = x.to_i-1
  
  for y in y1..y2
    canvas[y][x].should == colour
  end
end