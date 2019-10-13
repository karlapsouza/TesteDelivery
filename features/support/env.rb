require 'capybara'
require 'capybara/cucumber'
require 'byebug'
require 'selenium-webdriver'

Capybara.register_driver :selenium do |app|
  preferences = { credentials_enable_service: false,
                  password_manager_enabled: false }
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => { 'args' => ['--disable-infobars',
                                        'window-size=1600,1024'],
                             'prefs' => preferences }
      )
    )
  end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.default_max_wait_time = 5
end