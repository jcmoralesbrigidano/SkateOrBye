class Jam < ActiveRecord::Base
	has_and_belongs_to_many :skaters
end