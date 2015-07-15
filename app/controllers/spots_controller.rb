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

	def create
		@spot_params = params[:spot]
		raw_address = @spot_params["address"].split(//)
		@address = ''

		raw_address.each do |letter|
			if letter == '-'
				@address += ' '
			elsif letter == '_'
				@address += ','
			else
				@address += letter
			end
		end

		@spot = Spot.new
		@spot.address = @address
		@spot.latitude = @spot_params["latitude"]
		@spot.longitude = @spot_params["longitude"]
		@spot.level = @spot_params["level"]
		@spot.photo = @spot_params["photo"]

		if @spot.save
			respond_to do |format|
				format.html 
				format.json { render json: 1 }
			end
		else
			redirect_to '/'
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
end