class Trick < ActiveRecord::Base
	belongs_to :skater
	belongs_to :challenge
	has_many :ratings

	def self.spot_tricks spot
		where(spot_id: spot).order(average_rating: :desc)
	end
end