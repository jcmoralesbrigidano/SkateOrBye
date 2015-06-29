class ChallengesController < ApplicationController
	before_action :require_skater, only: [:index, :new]

	def index
		@skater = Skater.find session[:id]
		@pending_challenges = @skater.challenges.where(state: 'pending')
		@challenges_completed = Challenge.where(skater_id: @skater.id).where(state: 'completed')
		@challenges_to_check = Challenge.where(challenger_id: @skater.id).where(state: 'pending')
	end

	def new
		@challenge = Challenge.new		
		@spot = params[:spot]
	end

	def create
		@challenge_params = params[:challenge]
		@skater = Skater.where(name: @challenge_params['challenged_name']).first
		@challenge = @skater.challenges.new
		@challenge.challenger_id = @challenge_params['challenger_id']		
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

	def check_attempt
		@attempt_params = params[:attempt]
		@challenge = Challenge.find @attempt_params['challenge_id']
		@challenge.state = 'completed' unless @attempt_params['Bad']

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