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

	def rate_trick
		@trick_rating = params[:trickRating]
		@spot_id = @trick_rating['spot_id']
		@trick_id = @trick_rating['trick_id']
		@hearts = @trick_rating['hearts']

		@skater = Skater.find session[:id]
		@trick = @skater.tricks.find @trick_id
		@trick.rating = @hearts

		if @trick.save
			respond_to do |format|
				format.html
				format.json { render json: 1 }
			end
		else
			render 'show'
		end		
	end

	private
	def spot_params
		params.require(:spot).permit(:latitude, :longitude, :level, :floor_quality, :teachers, :photo)
	end
end