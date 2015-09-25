class CellPhone < ActiveRecord::Base
  belongs_to :manufacturer

  validates :year, presence: true
  validates :year, numericality: {greater_than_or_equal_to: 2003}
  validates :battery_life, presence: true

  validates :manufacturer_id, presence: true
end
