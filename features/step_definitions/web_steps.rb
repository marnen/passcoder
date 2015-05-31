Given 'I am on $page_name' do |page_name|
  visit path_to page_name
end

When 'I click "$target"' do |target|
  click_link_or_button target
end

When /^I fill in the following( for the last line item)?:$/ do |last, table|
  scope = last ? '.line_item:last-of-type' : 'html'
  within scope do
    table.rows_hash.each do |field, value|
      begin
        fill_in field, with: value
      rescue Capybara::ElementNotFound
        select value, from: field
      end
    end
  end
end

When 'I go to $page_name' do |page_name|
  visit path_to page_name
end

Then 'I should be on $page_name' do |page_name|
  expect(page.current_path).to be == path_to(page_name)
end
