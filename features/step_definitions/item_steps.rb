Given 'an item exists named "$name"' do |name|
  FactoryGirl.create :item, name: name
end
