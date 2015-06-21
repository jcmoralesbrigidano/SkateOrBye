class Trick < ActiveRecord::Base
	belongs_to :skater
	has_many :ratings

	def self.spot_tricks spot
		where(spot_id: spot)
	end

	def self.best_trick_of_the_spot spot
		spot_tricks = Trick.where(spot_id: spot)
		best_trick_of_the_spot = spot_tricks.order(average_rating: :desc).first
	end
end