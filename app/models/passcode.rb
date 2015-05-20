class Passcode < ActiveRecord::Base
  attr_accessor :resonator_level, :resonator_quantity

  has_many :line_items

  validates :code, presence: true, uniqueness: true
  validates :ap, numericality: true
  validates :xm, numericality: true

  def self.permitted_params
    [:code, :ap, :xm]
  end
end
