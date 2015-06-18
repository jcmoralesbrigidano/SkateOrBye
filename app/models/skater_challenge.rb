class SkaterChallenge < ActiveRecord::Base
	belongs_to :skater
	belongs_to :challenge
end