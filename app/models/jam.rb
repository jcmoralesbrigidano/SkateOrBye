class Jam < ActiveRecord::Base
	#has_and_belongs_to_many :skaters
	has_many :attendances
	has_many :skaters, through: :attendances
end