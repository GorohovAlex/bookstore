require 'image_processing/mini_magick'

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick
  plugin :processing
  plugin :versions

  IMAGE_THUMBNAIL_SIZE = {
    small: [180, 120],
    medium: [156, 250],
    large: [555, 380]
  }.freeze

  process(:store) do |io, _context|
    versions = { original: io }
    io.download do |original|
      pipeline = ImageProcessing::MiniMagick.source(original)

      IMAGE_THUMBNAIL_SIZE.each do |size|
        versions[size[0].to_sym] = pipeline.resize_to_limit!(size[1][0], size[1][1])
      end
    end
    versions
  end
end
