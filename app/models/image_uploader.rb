require 'image_processing/mini_magick'

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick
  plugin :processing
  plugin :versions

  Attacher.validate do
    # validate_max_size 15.megabytes, message: 'is too large (max is 15 MB)'
    # validate_mime_type_inclusion ['image/jpeg', 'image/png', 'image/gif']
  end

  process(:store) do |io, context|
    versions = { original: io }
    io.download do |original|
      pipeline = ImageProcessing::MiniMagick.source(original)
      versions[:thumbnail_small] = pipeline.resize_to_limit!(100, 100)
      versions[:large] = pipeline.resize_to_limit!(800, 800)
      versions[:medium] = pipeline.resize_to_limit!(500, 500)
    end
    versions 
  end
end
