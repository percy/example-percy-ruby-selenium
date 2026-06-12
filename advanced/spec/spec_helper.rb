# PER-8195 — RSpec helpers: starts WEBrick on PORT, opens a headless firefox
# driver, tears both down after the suite.

require 'bundler/setup'
require 'percy'
require 'webrick'
require 'selenium-webdriver'

PORT = ENV.fetch('PORT_NUMBER', '8008').to_i
TEST_URL = "http://localhost:#{PORT}"
APP_ROOT = File.expand_path('..', __dir__)

RSpec.configure do |config|
  config.before(:suite) do
    $server = WEBrick::HTTPServer.new(
      Port: PORT,
      DocumentRoot: File.expand_path('..', APP_ROOT),
      Logger: WEBrick::Log.new(File::NULL),
      AccessLog: []
    )
    $server_thread = Thread.new { $server.start }

    options = Selenium::WebDriver::Firefox::Options.new(args: ['--headless'])
    options.binary = ENV['FIREFOX_BINARY'] if ENV['FIREFOX_BINARY']
    $driver = Selenium::WebDriver.for(:firefox, options: options)
  end

  config.after(:suite) do
    $driver&.quit
    $server&.shutdown
    $server_thread&.kill
  end
end

def seed_todo
  $driver.navigate.to(TEST_URL)
  $driver.find_element(class: 'new-todo').send_keys('Walk the dog', :return)
end
