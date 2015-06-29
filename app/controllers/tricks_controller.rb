class TricksController < ApplicationController
	before_action :require_skater, only: [:new]

	def new
		@skater = Skater.find params[:skater_id]
		@skater_id = @skater.id
		@spot_id = params["spot_id"]
		@challenge_id = params["challenge_id"]
		@trick = @skater.tricks.new
	end

	def create
		@skater = Skater.find params[:skater_id]
		@trick = @skater.tricks.new trick_params
		
		if @trick.save
			redirect_to spot_path @trick.spot_id
		else
			render 'new'
		end
	end

	private
	def trick_params
		params.require(:trick).permit(:challenge_id, :video, :skater_id, :spot_id)
	end
end