class Colour

  def initialize(colour)
    if colour.length == 1 && colour.match(/[A-Z]+/)
      @colour = colour
    else
      @output.puts "Error: That is not a valid colour, valid colours are A-Z"
      false
    end
  end

  def to_s
    @colour
  end
end