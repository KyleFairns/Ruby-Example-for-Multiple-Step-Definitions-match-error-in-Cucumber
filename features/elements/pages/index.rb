Project.class_eval do
  class Pages
    def initialize
    end

    # Added for simple usability (no more Google.new)
    def google
      Google.new
    end

  end
end