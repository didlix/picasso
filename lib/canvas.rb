# Based on a 2D Array
  class Canvas
    def initialize(rows, cols, output)
      # create 2D array setting each element to 'O'
      @data = Array.new(rows) { Array.new(cols) { 'O' } }
      
      # Set number of rows and cols (remembering array starts at 0)
      @rows = rows-1
      @cols = cols-1

      @output = output
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

    def in_bounds?(y, x)
      if y >= 0 && y <= @rows && x >= 0 && x <= @cols
        true
      else
        @output.puts "Error: The pixel you tried to colour is out of range of the canvas"
        false
      end
    end
  end