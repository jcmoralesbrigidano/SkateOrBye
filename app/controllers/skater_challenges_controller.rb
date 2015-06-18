class SkaterChallengesController < ApplicationController
	def index
		@skater = Skater.find session[:id]
		@skater_challenges = @skater.skater_challenges

		@challenges = []

		@skater_challenges.each do |skater_challenge|
			@challenges.push(Challenge.where(id: skater_challenge.challenge_id).first)
		end
	end
end