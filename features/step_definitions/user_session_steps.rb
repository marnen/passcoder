Given 'I am logged in' do
  password = FFaker::Lorem.sentence
  user = FactoryGirl.create :user, password: password

  visit new_user_session_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: password
  click_on 'Log in'
end

Given 'I am not logged in' do
  visit destroy_user_session_path
end

Then 'I should be logged in' do
  expect(page).to have_text 'Signed in successfully.'
end
