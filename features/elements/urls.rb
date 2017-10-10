Project.class_eval do

  class Urls

    def urls
      {
          home: 'http://www.google.com/'
      }
    end

    def go_to(page_reference)
      driver = get_driver

      if /^https?:\/\// =~ page_reference
        # This is for when passed a url, rather than a reference
        address = page_reference
      else
        # Looks through the URLs map to pull out correct reference
        all_urls = Project.new.urls.urls
        address = all_urls[:"#{page_reference}"]
      end

      driver.navigate.to address
    end
  end
end