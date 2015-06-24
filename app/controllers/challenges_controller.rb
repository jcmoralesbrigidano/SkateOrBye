class ChallengesController < ApplicationController
	before_action :require_skater, only: [:new]

	def new
		@challenge = Challenge.new		
		@spot = params[:spot]
	end

	def create
		#@challenge = Challenge.new challenge_params
		@challenge = Challenge.new
		@challenge.challenge_spot = params[:spotId]

		if @challenge.save
			respond_to do |format|
				format.html
				format.json { render json: 1 }
			end
		else
			redirect_to '/jams'
		end
=begin
		if @challenge.save
			@skater = Skater.where(name: params[:challenge][:skater_challenged]).first
			@skater_challenge = @skater.skater_challenges.new
			@skater_challenge.skater_id = @skater.id
			@skater_challenge.challenge_id = @challenge.id
			@skater_challenge.state = 'pending'
			@skater_challenge.save

			redirect_to spots_path
		else
			render 'new'
		end
=end
	end

	private
	def challenge_params
		params.require(:challenge).permit(:challenge, :score, :skater_challenged)
	end
end