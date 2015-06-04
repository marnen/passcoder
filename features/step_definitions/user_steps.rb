Given 'no users exist' do
  User.delete_all
end

Given 'the following user exists:' do |table|
  FactoryGirl.create :user, table.rows_hash
end

Then 'the following user should exist:' do |table|
  fields = table.rows_hash
  password = fields.delete 'password'
  user = User.where(fields).first
  debugger unless user
  expect(user).to be_present
  if password
    expect(user.valid_password? password).to be == true
  end
end
