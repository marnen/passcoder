class Passcode < ActiveRecord::Base
  has_many :line_items, inverse_of: :passcode
  accepts_nested_attributes_for :line_items, reject_if: proc {|attributes| attributes.values.any? &:blank? }

  validates :code, presence: true, uniqueness: true
  validates :ap, numericality: true
  validates :xm, numericality: true

  def self.permitted_params
    @permitted_params ||= [:code, :ap, :xm, {line_items_attributes: LineItem.permitted_params}]
  end
end
