class Passcode < ActiveRecord::Base
  validates :code, presence: true, uniqueness: true
  validates :ap, numericality: true
  validates :xm, numericality: true

  def self.permitted_params
    [:code, :ap, :xm]
  end
end
