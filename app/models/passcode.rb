class Passcode < ActiveRecord::Base
  has_many :line_items, inverse_of: :passcode
  accepts_nested_attributes_for :line_items, reject_if: proc {|attributes| attributes[:item_id].blank? }

  validates :code, presence: true, uniqueness: true
  validates :ap, numericality: true
  validates :xm, numericality: true

  class << self
    def new_with_line_items
      new.tap {|passcode| passcode.line_items.build }
    end

    def permitted_params
      @permitted_params ||= [:code, :ap, :xm, {line_items_attributes: LineItem.permitted_params}]
    end

    def with_items
      includes line_items: :item
    end
  end
end
