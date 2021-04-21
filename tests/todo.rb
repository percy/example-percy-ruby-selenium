require "bundler/setup"

require 'percy'
require 'webrick'
require 'selenium-webdriver'

Thread.new {
  server = WEBrick::HTTPServer.new(Port: 8000, DocumentRoot: "./")
  server.start
}

options = Selenium::WebDriver::Firefox::Options.new(args: ['--headless'])
driver = Selenium::WebDriver.for(:firefox, capabilities: [options])
wait = Selenium::WebDriver::Wait.new(:timeout => 8)

# go to the example app
driver.navigate.to('http://localhost:8000')
new_todo_input = wait.until { driver.find_element(:class => "new-todo") }

# snapshot empty state
Percy.snapshot(driver, 'Empty Todo State')

# snapshot with a new todo
new_todo_input.send_keys('Try Percy')
new_todo_input.send_keys(:return)
Percy.snapshot(driver, 'With a Todo')

# snapshot with a completed todo
todo_toggle = wait.until { driver.find_element(:class => "toggle") }
todo_toggle.click
Percy.snapshot(driver, 'Completed Todo')

driver.quit
