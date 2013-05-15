require "spec_helper"
require "colour"

module Picasso
  class App
    describe Colour do
      describe "When creating a new Colour object" do
        it "returns the colour passed to it" do
          App::Colour.new("X").to_s.should == "X"
        end
        it "raises an exception if the colour is not A-Z" do
          expect { App::Colour.new("1") }.to raise_error(InvalidColourException)
        end
        it "raises an exception if a colour is more than 1 character in length" do
          expect { App::Colour.new("XX") }.to raise_error(InvalidColourException)
        end
      end
    end
  end
end
