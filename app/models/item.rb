class Item < ActiveRecord::Base
  has_many :line_items

  [:name, :abbreviation].each do |field|
    validates field, presence: true, uniqueness: true
  end
end
