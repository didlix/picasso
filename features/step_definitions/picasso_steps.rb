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

# ascii artist creates canvas

Given /^Picasso is running$/ do
  @picasso = Picasso::App.new(output)
  @picasso.start
end

When /^I enter the command "([^"]*)"$/ do |command|
  @picasso.command(command)
end

Then /^I should see a canvas with (\d+) columns and (\d+) rows$/ do |cols, rows|
  puts output.messages
  canvas = output.messages.select {|x| x =~ /[A-Z]*/ }
  number_of_expected_pixels = cols.to_i * rows.to_i
end

Then /^all pixels on that canvas should be "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end