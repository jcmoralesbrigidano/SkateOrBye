class Challenge < ActiveRecord::Base
	belongs_to :skater
	has_one :trick
end