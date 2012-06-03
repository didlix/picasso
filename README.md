Picasso
=======

As is usual when I do a code test, here is a list of everything I think I did wrong:

- Used bad English in the cucumber tests
- Wasted time on cucumber (for personal interest) when I should have saved time writing RSpec tests
- Didn't end up with enough DRY (Don't repeat yourself)
- Lots and lots more tests could be written, and this also highlights some user experience issues:
  - What happens if you create a canvas while one exists? Error, or does it just make the new canvas?
  

Oh and to run on a Mac with Ruby 1.9.2 (the only platform I tested it on, yes I know "it works on my machine" - "Well let's deploy your machine then") simply run the following command:

bin/picasso


--
didlix