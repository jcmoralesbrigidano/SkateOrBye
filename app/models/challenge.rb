class Challenge < ActiveRecord::Base
	has_many :skater_challenges
	has_many :skaters, through: :skater_challenges
end