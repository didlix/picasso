#!/usr/bin/env ruby
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__) 
require 'picasso'
picasso = Picasso::App.new(STDOUT)
picasso.start

while true do
  picasso.command(STDIN.gets)
end