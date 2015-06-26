class ChallengesController < ApplicationController
	before_action :require_skater, only: [:new]

	def index
		@skater = Skater.find session[:id]
		@challenges = @skater.challenges		
	end

	def new
		@challenge = Challenge.new		
		@spot = params[:spot]
	end

	def create
		@challenge_params = params[:challenge]
		@skater = Skater.where(name: @challenge_params['skater_name']).first
		@challenge = @skater.challenges.new		
		@challenge.skater_id = @skater.id
		@challenge.challenge_spot = @challenge_params['spot_id']
		@challenge.challenge = @challenge_params['challenge_trick']
		@challenge.score = @challenge_params['challenge_score']		
		@challenge.state = 'pending'

		if @challenge.save			
			respond_to do |format|
				format.html
				format.json { render json: 1 }
			end
		else
			redirect_to '/'
		end
	end

	private
	def challenge_params
		params.require(:challenge).permit(:challenge, :score, :skater_id)
	end
end