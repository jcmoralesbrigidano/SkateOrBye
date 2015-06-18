class Skater < ActiveRecord::Base
	has_secure_password
	has_many :tricks
	has_many :skater_challenges
	has_many :challenges, through: :skater_challenges
end