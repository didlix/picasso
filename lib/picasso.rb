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
      
      case command_parts[0]

      when "I"  
        rows = command_parts[2]
        cols = command_parts[1]
        self.create_canvas(rows.to_i, cols.to_i)

      when "S"
        self.render_canvas

      when "L"
        y = command_parts[2].to_i
        x = command_parts[1].to_i
        colour = command_parts[3]
        @canvas[x-1,y-1] = colour
        
      else
        @output.puts "Error: The command you entered is not valid"
      end

    end
    
    def create_canvas(rows, cols)
      if self.is_valid_size?(rows) && self.is_valid_size?(cols)
        @canvas = Canvas.new(rows, cols)
      else
        @output.puts "Error: Your canvas size is out of bounds"
      end
    end
    
    def render_canvas
      @canvas.get_canvas.each do |row|
        @output.puts row.join('')
      end
    end
    
    # check if a supplied value is the right size
    def is_valid_size?(length)
      length <= 250 && length >= 1
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