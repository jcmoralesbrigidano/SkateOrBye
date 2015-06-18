class ChallengesController < ApplicationController
	before_action :require_skater, only: [:new]

	def new
		@spot = params[:id]
		@challenge = Challenge.new
	end

	def create
		@challenge = Challenge.new challenge_params

		if @challenge.save
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