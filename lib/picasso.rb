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

        if command == "C" and command_parts.count == 3
          cols = command_parts[1]
          rows = command_parts[2]
          self.create_canvas(cols.to_i, rows.to_i)
        elsif command == "S"
          self.render_canvas
        end

      end
    end
    
    def create_canvas(cols, rows)
      @canvas = Canvas.new(cols, rows)
    end
    
    def render_canvas
      @output.puts @canvas.render
    end
    
  end
  
  # Based on a 2D Array
  class Canvas
    def initialize(cols, rows)
      # create 2D array setting each element to 'O'
      @data = Array.new(cols) { Array.new(rows) { 'O' } }
    end

    def [](x, y)
      @data[x][y]
    end

    def []=(x, y, value)
      @data[x][y] = value
    end
    
    def render
      @data[1][1]='B'
      @data.transpose
      foo = @data.each
    end
  end
  
end