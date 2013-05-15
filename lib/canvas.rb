# Based on a 2D Array
  class Canvas

    attr_reader :rows, :cols

    def initialize(rows, cols, output)
      # create 2D array setting each element to 'O'
      @data = Array.new(rows) { Array.new(cols) { 'O' } }
      
      # Set number of rows and cols (remembering array starts at 0)
      @rows = rows-1
      @cols = cols-1

      @output = output
    end

    def [](y, x)
      @data[y][x]
    end

    def []=(y, x, value)
      if in_bounds?(y, x)
        @data[y][x] = value
      end
    end
    
    def get_canvas
      @data
    end

    def in_bounds?(y, x)
      if y >= 0 && y <= @rows && x >= 0 && x <= @cols
        true
      else
        @output.puts "Error: The pixel you tried to colour is out of range of the canvas"
        false
      end
    end
  end