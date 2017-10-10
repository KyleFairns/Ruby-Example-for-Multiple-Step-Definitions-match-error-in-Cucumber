require_relative './index'

Pages.class_eval do
  class Google
    def initialize
    end

    def elements
      {
          search: {css: 'input[name="q"]'},
          result: {css: 'h3.r'}
      }
    end

    # Page Object Model contains methods within the class definition.
    # Sends search term to the search box on google, and presses enter
    def search_for(search_term)
      driver = get_driver
      search = driver.find_element(elements[:search])

      search.send_keys(search_term)
      search.send_keys(:enter)
    end

    # Checks for a result
    def find_result
      driver = get_driver
      result = driver.find_element(elements[:result])
      wait = Selenium::WebDriver::Wait.new(:timeout => 10)

      wait.until {
        result.displayed?
      }
    end
  end
end
