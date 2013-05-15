require "spec_helper"

module Picasso
	describe App do
		describe "#start" do
			it "sends a welcome message and prompts for a command" do
				output = double('output')
				output.should_receive(:puts).with('Welcome to Picasso!')
				output.should_receive(:puts).with('Enter command:')
				app = App.new(output).start				
			end
		end
	end
end