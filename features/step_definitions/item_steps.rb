Given 'an item exists named "$name"' do |name|
  FactoryGirl.create :item, name: name
end

Given 'the following items exist:' do |table|
  table.hashes.each do |row|
    FactoryGirl.create :item, row
  end
end
