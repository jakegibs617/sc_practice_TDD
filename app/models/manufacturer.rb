class Manufacturer < ActiveRecord::Base
	has_many :cell_phones
	
	validates :name, presence: true
	validates :country, presence: true
end
