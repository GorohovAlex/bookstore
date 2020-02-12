require 'capybara/rspec'
require 'capybara/rails'
require 'selenium-webdriver'
require 'site_prism'
require 'site_prism/all_there'

RSpec.configure do |_config|
  Capybara.register_driver :site_prism do |app|
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: { args: %w[headless enable-features=NetworkService,NetworkServiceInProcess] }
    )
    Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
  end

  Capybara.default_driver = :site_prism
  Capybara.javascript_driver = :site_prism
end
