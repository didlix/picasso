 class Picasso::App
    def initialize(output)
      @output = output
    end
    
    def start
      @output.puts 'Welcome to Picasso!'
      @output.puts 'Enter command:'
    end
    
    def parse_params(object, *args)
      arr = []
      args.each do |type|
        param = object.shift
        case type
          when :int  then arr << param.to_i - 1
          when :canvas_size  then arr << param.to_i
          when :colour then arr << param
        end
      end
      return *arr
    end



    def command(command)
      command_parts = command.split

      case command_parts.shift
        when "I"
          rows, cols = parse_params(command_parts, :canvas_size, :canvas_size)
          create_canvas(rows, cols)

        when "S"
          render_canvas

        when "L"
          x, y, colour = parse_params(command_parts, :int, :int, :colour)
          if is_valid_colour?(colour) && @canvas.in_bounds?(y, x)
            fill_pixel(y, x, colour)
          end
        
        when "H"
          x1, y, x2, colour = parse_params(command_parts, :int, :int, :int, :colour)
          
          if is_valid_colour?(colour)
            draw_horizontal_line(x1, x2, y, colour)
          end

        when "V"
          y1 = command_parts[1].to_i-1
          y2 = command_parts[2].to_i-1        
          x = command_parts[0].to_i-1
          colour = command_parts[3]        
          
          y1, x, y2, colour = parse_params(command_parts, :int, :int, :int, :colour)

          if is_valid_colour?(colour)
            draw_vertical_line(y1, y2, x, colour)
          end
          
        when "F"
          x, y, colour = parse_params(command_parts, :int, :int, :colour)

          if is_valid_colour?(colour) && @canvas.in_bounds?(y, x)
            bucket_fill(y, x, colour)
          end
          
        when "X"
          @output.puts "Goodbye!"
          exit
          
        else
          @output.puts "Error: The command you entered is not valid"
      end
    end
    
    def create_canvas(rows, cols)
       
      if is_valid_size?(rows) && is_valid_size?(cols)
        @canvas = Canvas.new(rows, cols, @output)
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
        fill_pixel(y, x, colour)
      end
    end

    # Check if a colour is valid, if it is valid, return the colour otherwise puts an error and return false
    def is_valid_colour?(colour)
      if colour.length == 1 && colour.match(/[A-Z]+/)
        colour
      else
        @output.puts "Error: That is not a valid colour, valid colours are A-Z"
        false
      end
    end

    def draw_vertical_line(y1, y2, x, colour)
      for y in y1..y2
        fill_pixel(y, x, colour)
      end
    end
    
    def fill_pixel(y, x, colour)
      if @canvas.in_bounds?(y,x)
        @canvas[y,x] = colour
      end
    end
    
    def bucket_fill(y, x, replacement_colour)
    
      if @canvas.in_bounds?(y, x)

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
          
          # co-ordinates are not in buffer and are within the canvas range
          if @buffer.include?(yx) == false && y <= @canvas.rows && x <= @canvas.cols 
            
            # if target pixel is the target colour
            if @canvas[y,x] == @target_colour      
              fill_pixel(y, x, replacement_colour)
        
              # add this place to our buffer so we don't go there again
              @buffer << yx
              
              possible_neighbours = Array.new
              
              # Don't try to go out of bounds of the canvas
              if x-1 >= 0
                possible_neighbours << "#{y},#{x-1}"
              end

              if x+1 <= @canvas.cols
                possible_neighbours << "#{y},#{x+1}"
              end

              if y-1 >= 0
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
      else
        
      end 
    end
  end