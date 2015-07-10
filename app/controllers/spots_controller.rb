class SpotsController < ApplicationController
	before_action :require_skater, only: [:new, :rate_trick]	
	helper_method :skater_name, :trick_rated?

	def index
		spots = Spot.all

		respond_to do |format|
			format.html 
			format.json { render json: spots }
		end
	end

	def show
		@spot = Spot.find params[:id]
		@spot_tricks = Trick.spot_tricks @spot.id
	end

	def skater_name skater_id
		Skater.find_by(id: skater_id).name
	end

	def trick_rated? trick
		ratings = trick.ratings
		rated = false		

		ratings.each do |rating|
			if rating.skater_id == session[:id]
				rated = true
			end
		end

		rated
	end

	def new
		@spot = Spot.new

		@latitude = params[:latitude]
		@longitude = params[:longitude]
		address = params[:address].split(//)
		@addressCorrection = ''

		address.each do |letter|
			if letter == '-'
				@addressCorrection += ' '
			elsif letter == '_'
				@addressCorrection += ','
			else
				@addressCorrection += letter
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
		@hearts_selected = @trick_rating['hearts_selected']

		@trick = Trick.find @trick_id
		@rating = @trick.ratings.new
		@rating.rating = @hearts_selected
		@rating.skater_id = session[:id]

		if @rating.save
			@ratings = @trick.ratings
			@total_rating = 0

			@ratings.each do |rating|
				@total_rating += rating.rating
			end

			@average_rating = @total_rating.to_f / @ratings.size.to_f
			@trick.average_rating = @average_rating

			if @trick.save
				redirect_to spot_path params[:id]
			else
				render 'show'
			end
		else
			render 'show'
		end		
	end

	private
	def spot_params
		params.require(:spot).permit(:address, :latitude, :longitude, :level, :photo)
	end
end