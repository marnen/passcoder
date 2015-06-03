class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :passcode

  validates_presence_of :item_id, :item_level, :passcode, :quantity

  def self.permitted_params
    [:item_id, :item_level, :quantity]
  end
end
