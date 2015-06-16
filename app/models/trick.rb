class Trick < ActiveRecord::Base
	belongs_to :skater
	has_many :ratings

	def self.spot_tricks spot
		where(spot_id: spot)
	end
end