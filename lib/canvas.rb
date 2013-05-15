# Based on a 2D Array
class Picasso::App::Canvas

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
      # +1 all numbers for user as internal pointers differ from user's experience
      raise Picasso::InvalidCanvasLocationException, "Can't have '#{x+1}, #{y+1}' as a pixel in canvas sized '#{@cols+1}, #{@rows+1}'."
    end
  end
end
