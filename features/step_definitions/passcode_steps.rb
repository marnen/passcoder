Given 'no passcodes exist' do
  Passcode.destroy_all
end

Then 'I should see the following passcode:' do |table|
  within '.passcode' do
    table.rows_hash.each do |field, value|
      expect(page).to have_selector ".#{field.downcase}", text: value
    end
  end
end
