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
        self.fill_pixel(y, x, colour)
      
      when "H"
        x1 = command_parts[1].to_i-1
        x2 = command_parts[2].to_i-1        
        y = command_parts[3].to_i-1
        colour = command_parts[4]        
        self.draw_horizontal_line(x1, x2, y, colour)

      when "V"
        y1 = command_parts[2].to_i-1
        y2 = command_parts[3].to_i-1        
        x = command_parts[1].to_i-1
        colour = command_parts[4]        
        self.draw_vertical_line(y1, y2, x, colour)
        
      when "F"
        x = command_parts[1].to_i-1
        y = command_parts[2].to_i-1
        colour = command_parts[3]
        self.bucket_fill(y, x, colour)
        
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
        self.fill_pixel(y, x, colour)
      end
    end

    def draw_vertical_line(y1, y2, x, colour)
      for y in y1..y2
        self.fill_pixel(y, x, colour)
      end
    end
    
    def fill_pixel(y, x, colour)
      @canvas[y,x] = colour
    end
    
    def bucket_fill(y, x, replacement_colour)
    
      @target_colour = @canvas[y,x]

      # Add first co-ordinate to the queue
      @queue = Array.new(1) { "#{y},#{x}" }
      @buffer = Array.new
            
      while @queue.count > 0 do
        yx = @queue.last
        split_yx = yx.split ','
        y = split_yx[0].to_i
        x = split_yx[1].to_i
        
        # remove element we are processing from the queue
        @queue.delete(yx)
        @output.puts yx
        
        # co-ordinates are not in buffer and are within the canvas range
        if @buffer.include?(yx) == false && y <= @canvas.rows && x <= @canvas.cols 
          
          # if target pixel is the target colour
          if @canvas[y,x] == @target_colour      
            self.fill_pixel(y, x, replacement_colour)
      
            # add this place to our buffer so we don't go there again
            @buffer << yx
            
            possible_neighbours = Array.new
            
            if x-1 > 0
              possible_neighbours << "#{y},#{x-1}"
            end

            if x+1 <= @canvas.cols
              possible_neighbours << "#{y},#{x+1}"
            end

            if y-1 > 0
              possible_neighbours << "#{y-1},#{x}"
            end

            if y+1 <= @canvas.rows
              possible_neighbours << "#{y+1},#{x}"
            end
            
            # neighbours that may or may not be in the buffer
            possible_neighbours.each do |possible_neighbour|   

              # add places we have never been before to the queue
              if @buffer.include?(possible_neighbour) == false
                @queue << possible_neighbour
              end
            end
          end
        else
          @buffer << yx
        end
      end 
    end
  end
  
  # Based on a 2D Array
  class Canvas
    def initialize(rows, cols)
      # create 2D array setting each element to 'O'
      @data = Array.new(rows) { Array.new(cols) { 'O' } }
      
      # Set number of rows and cols (remembering array starts at 0)
      @rows = rows-1
      @cols = cols-1
    end

    # number of cols
    def cols
      @cols
    end
    
    # number or rows
    def rows
      @rows
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