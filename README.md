Picasso
=======

As is usual when I do a code test, here is a list of everything I thought of, or think that I did wrong, or didn't like:

- Used bad English in the cucumber tests
- Wasted time on cucumber (for personal interest) when I should have saved time writing RSpec tests
- Didn't end up with enough DRY (Don't repeat yourself)
- I'm not doing any kind of sensible approach to error handling
- I don't like how I am passing command parts
- Lots and lots more tests could be written
- User experience issues:
  - What happens if you create a canvas while one exists?
  - When testing the app with a user they wanted the canvas to show after each command
  - User testing also highlighted that a lack of feedback after a correct command made them wonder if it had worked
  

Tested on Lion and Mountain Lion with Ruby 1.9.2

If you want to run tests make sure you "bundle install", then type "cucumber"

Run the app by going into the directory and entering the command:

bin/picasso


--
didlix