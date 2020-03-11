class Cover < ApplicationRecord
  include ImageUploader::Attachment.new(:image)
  
  belongs_to :book
end
