class Trick < ActiveRecord::Base
	belongs_to :skater

	def self.spot_tricks spot
		where(spot_id: spot)
	end
end