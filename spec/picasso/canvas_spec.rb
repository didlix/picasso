require "spec_helper"
require "canvas"
require "colour"

module Picasso
  class App
    describe Canvas do
      describe "#new" do
        it "checks that the canvas is not too big" do
          expect { App::Canvas.new(251, 251) }.to raise_error(InvalidCanvasSizeException)
        end
        it "checks that the canvas is not too small" do
          expect { App::Canvas.new(0, 0) }.to raise_error(InvalidCanvasSizeException)
        end
        it "checks that the canvas is not totally bonkers" do
          expect { App::Canvas.new(-1, -1) }.to raise_error(InvalidCanvasSizeException)
        end
      end
      describe "#get_canvas" do
        it "returns a canvas when Canvas has been initialised" do
          canvas = Canvas.new(10,10)
          canvas.get_canvas.flatten.length.should == 100
        end
      end
      describe "#in_bounds?" do
        it "should return true if the x,y coordinates exist with in the canvas array" do
          canvas = Canvas.new(10,10)
          # Canvas#new will create an array where the index starts at 0, so 9,9 is the
          # equivilant of 10,10
          canvas.in_bounds?(9,9).should == true
          canvas.in_bounds?(0,0).should == true
        end
        it "should raise an exception if the x,y coordinates exist outside of the canvas array" do
          canvas = Canvas.new(10,10)
          # Canvas#new will create an array where the index starts at 0, so 9,9 is the
          # equivilant of 10,10
          expect { canvas.in_bounds?(10,10) }.to raise_error(Picasso::InvalidCanvasLocationException)
          expect { canvas.in_bounds?(-1,-1) }.to raise_error(Picasso::InvalidCanvasLocationException)
        end
      end
      describe "#[](y, x)" do
        it "Should set the defined point in the array to the provided input" do
          canvas = Canvas.new(22,22)
          canvas[10,20] = Colour.new("Y")
          canvas[10,20].should eq("Y")
        end
      end
    end
  end
end
