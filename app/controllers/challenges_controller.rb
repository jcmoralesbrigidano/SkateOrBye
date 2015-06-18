require 'pry'

class ChallengesController < ApplicationController
	before_action :require_skater, only: [:new]

	def new
		@challenge = Challenge.new

		@spot = params[:spot]
	end

	def create
		binding.pry
		@challenge = Challenge.new challenge_params

		if @challenge.save
			@skater = Skater.find params[:skater_challenged]
			@challenge_accepted = @skater.challenges.new
			@challenge_accepted.skater_id = @skater.id
			@challenge_accepted.challenge_id = @challenge.id
			@challenge_accepted.state = 'pending'
			@challenge_accepted.save

			redirect_to spots_path
		else
			render 'new'
		end
	end

	private
	def challenge_params
		params.require(:challenge).permit(:challenge, :challenge_spot, :score, :skater_challenged)
	end
end