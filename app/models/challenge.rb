class Challenge < ActiveRecord::Base
	has_many :challenge_accepteds
	has_many :skaters, through: :challenge_accepteds
	belongs_to :spot
end