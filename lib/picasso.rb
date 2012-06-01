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
        x = command_parts[1].to_i-1
        y = command_parts[2].to_i-1
        colour = command_parts[3]
        @canvas[y,x] = colour
      
      when "H"
        x1 = command_parts[1].to_i-1
        x2 = command_parts[2].to_i-1        
        y = command_parts[3].to_i-1
        colour = command_parts[4]        
        self.draw_horizontal_line(x1, x2, y, colour)

      when "V"
        y1 = command_parts[1].to_i-1
        y2 = command_parts[2].to_i-1        
        x = command_parts[3].to_i-1
        colour = command_parts[4]        
        self.draw_vertical_line(y1, y2, x, colour)
        
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
    
    def draw_horizontal_line(x1, x2, y, colour)
      x1 = x1
      x2 = x2
      y = y
      for x in x1..x2
        @canvas[y,x] = colour
      end
    end

    def draw_vertical_line(y1, y2, x, colour)
      for y in y1..y2
        @canvas[y,x] = colour
      end
    end
    
  end
  
  # Based on a 2D Array
  class Canvas
    def initialize(rows, cols)
      # create 2D array setting each element to 'O'
      @data = Array.new(rows) { Array.new(cols) { 'O' } }
    end

    def [](y, x)
      @data[y][x]
    end

    def []=(y, x, value)
      @data[y][x] = value
    end
    
    def get_canvas
      @data
    end
    
  end
  
end