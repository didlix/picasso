module Picasso

  require 'app'
  require 'canvas'
  require 'colour'

  class InvalidColourException < RuntimeError; end
  class InvalidCanvasLocationException < RuntimeError; end
  class InvalidCanvasSizeException < RuntimeError; end

end
