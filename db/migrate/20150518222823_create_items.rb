class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    add_index :items, :name, unique: true
  end
end
