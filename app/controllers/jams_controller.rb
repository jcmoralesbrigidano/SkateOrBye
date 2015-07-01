class JamsController < ApplicationController
	before_action :require_skater, only: [:new, :join_jam]
	
	def index
		@jams = Jam.all
	end

	def show
		@jam = Jam.find params[:id]
		@spot = Spot.where(id: @jam.spot_id).first
		@skaters = @jam.skaters
	end

	def new
		@jam = Jam.new
	end

	def create
		@jam = Jam.new jams_params

		if @jam.save
			redirect_to jams_path
		else
			render 'new'
		end
	end

	def join_jam
		@skater = Skater.find session[:id]
		@jam = Jam.find params[:jam_id]
		@jam.skaters.push @skater

		if @jam.save
			redirect_to jam_path @jam
		else
			render 'join_jam'
		end
	end

	private
	def jams_params
		params.require(:jam).permit(:name, :spot_id, :date, :time, :info)
	end
end