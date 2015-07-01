class TricksController < ApplicationController
	before_action :require_skater, only: [:create]
	
	def create
		@trick_params = params[:trick]
		@skater = Skater.find @trick_params["skater_id"]
		@trick = @skater.tricks.new
		@trick.skater_id = @trick_params["skater_id"]
		@trick.spot_id = @trick_params["spot_id"]
		@trick.video = @trick_params["trick_video"]
		
		if @trick.save
			respond_to do |format|
				format.html 
				format.json { render json: 1 }
			end
		else
			redirect_to '/'
		end
	end
end