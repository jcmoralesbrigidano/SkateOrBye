class SpotsController < ApplicationController
	before_action :require_skater, only: [:new]
	
	def index
		@spots = Spot.all

		respond_to do |format|
			format.html 
			format.json { render json: @spots }
		end
	end

	def show
		@spot = Spot.find params[:id]
		@spot_tricks = Trick.spot_tricks @spot.id
	end

	def new
		@spot = Spot.new

		@latitude = params[:latitude]
		@longitude = params[:longitude]
	end

	def create
		@spot = Spot.new spot_params

		if @spot.save
			redirect_to spots_path
		else
			render 'new'
		end
	end

	private
	def spot_params
		params.require(:spot).permit(:latitude, :longitude, :level, :floor_quality, :teachers, :photo)
	end
end