Given 'I am not logged in' do
  visit destroy_user_session_path
end

Then 'I should be logged in' do
  expect(page).to have_text 'Signed in successfully.'
end
