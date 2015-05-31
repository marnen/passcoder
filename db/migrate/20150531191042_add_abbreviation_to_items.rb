class AddAbbreviationToItems < ActiveRecord::Migration
  def change
    add_column :items, :abbreviation, :character, null: false
    add_index :items, :abbreviation, unique: true

    Item.all.each do |item|
      item.update_attributes abbreviation: item.name[0]
    end
  end
end
