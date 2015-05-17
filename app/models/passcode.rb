class Passcode < ActiveRecord::Base
  validates :code, presence: true, uniqueness: true
  validates :xm, numericality: true
end
