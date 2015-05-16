Given 'the following user exists:' do |table|
  FactoryGirl.create :user, table.rows_hash
end
