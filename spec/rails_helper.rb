require 'simplecov'
SimpleCov.minimum_coverage 90
SimpleCov.start 'rails' do
  add_group 'Forms', 'app/forms'
end

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)
require 'spec_helper'
require 'rspec/rails'
require 'devise'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include OmniAuthTestHelper, type: :controller
  config.include Warden::Test::Helpers, type: :feature
  config.filter_rails_from_backtrace!
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = true
end
