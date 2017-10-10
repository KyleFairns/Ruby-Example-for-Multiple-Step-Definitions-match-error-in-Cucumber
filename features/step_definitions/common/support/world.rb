require 'selenium-webdriver'
require 'yaml'

def start_driver

  setup = YAML.load_file('setup.yml')

  prefs = {
      setAlertBehaviour: 'dismiss',
      unexpectedAlertBehaviour: 'dismiss',
      restart: 'true'
  }

  profile = setup['profiles'][setup['profile']]
  browser = profile['browser']['name'].downcase

  Selenium::WebDriver.for :"#{browser}", prefs: prefs
end

def get_driver
  unless $driver
    $driver = start_driver
  end

  $driver
end


