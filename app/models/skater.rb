class Skater < ActiveRecord::Base
	has_secure_password
	has_many :tricks
	has_many :challenges
	has_many :attendances
	has_many :jams, through: :attendances
end