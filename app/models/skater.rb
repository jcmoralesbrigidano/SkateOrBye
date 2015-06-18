class Skater < ActiveRecord::Base
	has_secure_password
	has_many :tricks
	has_many :challenge_accepteds
	has_many :challenges, through: :challenge_accepteds
end