class ChallengeAccepted < ActiveRecord::Base
	belongs_to :skater
	belongs_to :challenge
end