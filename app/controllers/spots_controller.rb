class SpotsController < ApplicationController
	before_action :require_skater, only: [:new, :rate_trick]
	
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
		@address = params[:address].split(//)
		@addressOk = ''

		@address.each do |letter|
			if letter == '-'
				@addressOk += ' '
			elsif letter == '_'
				@addressOk += ','
			else
				@addressOk += letter
			end
		end
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
		@trick_id = @trick_rating['trick_id']
		@hearts = @trick_rating['hearts']

		@trick = Trick.find @trick_id
		@rating = @trick.ratings.new
		@rating.rating = @hearts
		@rating.skater_id = session[:id]

		if @rating.save
			@ratings = @trick.ratings
			@total_rating = 0

			@ratings.each do |rating|
				@total_rating += rating.rating
			end

			@average_rating = @total_rating.to_f / @ratings.size.to_f
			@trick.average_rating = @average_rating
			@trick.save

			respond_to do |format|
				format.html
				format.json { render json: @trick.average_rating }
			end
		else
			render 'show'
		end		
	end

	private
	def spot_params
		params.require(:spot).permit(:address, :latitude, :longitude, :level, :floor_quality, :teachers, :photo)
	end
end