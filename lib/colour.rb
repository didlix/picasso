class Picasso::App::Colour
  def initialize(colour)
    if colour.length == 1 && colour.match(/[A-Z]+/)
      @colour = colour
    else
      raise Picasso::InvalidColourException, "Can't have #{colour} as a colour"
    end
  end

  def inspect
    to_s
  end

  def to_s
    @colour
  end
end
