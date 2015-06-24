class Skater < ActiveRecord::Base
	has_secure_password
	has_many :tricks
	has_many :challenges
	has_and_belongs_to_many :jams
end