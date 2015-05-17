Given 'I am on the home page' do
  visit '/'
end

When 'I click "$target"' do |target|
  click_link_or_button target
end

When 'I fill in the following:' do |table|
  table.rows_hash.each do |field, value|
    fill_in field, with: value
  end
end

When 'I go to the login page' do
  visit new_user_session_path
end

Then 'I should be on the passcode entry page' do
  expect(page.current_path).to be == new_passcode_path
end
