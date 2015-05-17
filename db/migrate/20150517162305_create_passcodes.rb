class CreatePasscodes < ActiveRecord::Migration
  def change
    create_table :passcodes do |t|
      t.string :code, null: false
      t.integer :xm, null: false, default: 0

      t.timestamps null: false
    end

    add_index :passcodes, :code, unique: true
  end
end
