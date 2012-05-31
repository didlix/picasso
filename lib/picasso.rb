module Picasso
  class App
    def initialize(output)
      @output = output
    end
    
    def start
      @output.puts 'Welcome to Picasso!'
      @output.puts 'Enter command:'
    end
    
    def command(command)
      command_parts = command.split
      command_parts[0].each do |command|

        if command == "I" and command_parts.count == 3
          rows = command_parts[2]
          cols = command_parts[1]
          self.create_canvas(rows.to_i, cols.to_i)
        elsif command == "S"
          self.render_canvas
        end

      end
    end
    
    def create_canvas(rows, cols)
      @canvas = Canvas.new(rows, cols)
    end
    
    def render_canvas
      @canvas.get_canvas.each do |row|
        @output.puts row.to_s
      end
    end
    
  end
  
  # Based on a 2D Array
  class Canvas
    def initialize(rows, cols)
      # create 2D array setting each element to 'O'
      @data = Array.new(rows) { Array.new(cols) { 'O' } }
    end

    def [](x, y)
      @data[x][y]
    end

    def []=(x, y, value)
      @data[x][y] = value
    end
    
    def get_canvas
      @data
    end
    
  end
  
end