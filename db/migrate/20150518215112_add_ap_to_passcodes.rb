class AddApToPasscodes < ActiveRecord::Migration
  def change
    add_column :passcodes, :ap, :integer, null: false, default: 0
  end
end
