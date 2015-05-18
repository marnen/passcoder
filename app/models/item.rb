class Item < ActiveRecord::Base
  has_many :line_items

  validates :name, presence: true, uniqueness: true
end
