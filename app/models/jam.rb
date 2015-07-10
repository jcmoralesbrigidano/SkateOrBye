class Jam < ActiveRecord::Base
	has_many :attendances
	has_many :skaters, through: :attendances
end