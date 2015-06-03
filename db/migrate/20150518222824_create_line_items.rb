class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :passcode_id, null: false
      t.integer :item_id, null: false
      t.string :item_level, null: false
      t.integer :quantity, null: false, default: 1

      t.timestamps null: false
    end

    add_foreign_key :line_items, :items
    add_foreign_key :line_items, :passcodes
  end
end
