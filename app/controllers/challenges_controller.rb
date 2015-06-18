class ChallengesController < ApplicationController
	before_action :require_skater, only: [:new]

	def new
		@challenge = Challenge.new		
		@spot = params[:spot]
	end

	def create
		@challenge = Challenge.new challenge_params

		if @challenge.save
			@skater = Skater.find params[:challenge][:skater_challenged]
			@skater_challenge = @skater.skater_challenges.new
			@skater_challenge.skater_id = @skater.id
			@skater_challenge.challenge_id = @challenge.id
			@skater_challenge.state = 'pending'
			@skater_challenge.save

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