google = Project.new.pages.google

When 'I search for {string}' do |search_term|
  google.search_for search_term
end

Then 'I should see a result' do
  google.find_result
end
