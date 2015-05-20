class Passcode < ActiveRecord::Base
  attr_accessor :resonator_level, :resonator_quantity

  has_many :line_items

  validates :code, presence: true, uniqueness: true
  validates :ap, numericality: true
  validates :xm, numericality: true

  def self.permitted_params
    [:code, :ap, :xm, :resonator_level, :resonator_quantity]
  end

  after_create do
    if resonator_level.present?
      resonator = Item.find_by_name('Resonator') || Item.create!(name: 'Resonator')
      self.line_items.create! item: resonator, item_level: resonator_level, quantity: resonator_quantity
    end
  end
end
