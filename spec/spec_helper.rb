# require 'simplecov'
# SimpleCov.start do
#   track_files '{app,lib}/**/*.rb'
#   add_group "Controllers", "app/controllers"
#   add_group "Models", "app/models"
# end

# require 'simplecov'

# SimpleCov.minimum_coverage 90
# SimpleCov.start do
#   track_files '{app,lib}/**/*.rb'
# end

if ENV['RAILS_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.start 'rails'
  puts "required simplecov"
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
