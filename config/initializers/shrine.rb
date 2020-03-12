require 'shrine'
require 'shrine/storage/file_system'
require 'shrine/storage/s3'

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :remote_url, max_size: nil

s3_options = {
  access_key_id: ENV['S3_KEY'],
  secret_access_key: ENV['S3_SECRET'],
  region: ENV['S3_REGION'],
  bucket: ENV['S3_BUCKET']
}

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
  store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store')

  # cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  # store: Shrine::Storage::S3.new(prefix: "store", **s3_options),
}
