class JamsController < ApplicationController
	before_action :require_skater, only: [:new, :join_jam]
	helper_method :meeting_joined?

	def index
		@jams = Jam.all
	end

	def show
		@jam = Jam.find params[:id]
		@spot = Spot.where(id: @jam.spot_id).first
		@attendances = @jam.attendances
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

	def meeting_joined?
		jam = Jam.find params[:id]
		attendances = @jam.attendances

		joined = false

		attendances.each do |attendance|
			if attendance.skater_id == session[:id]
				joined = true
			end
		end

		joined
	end

	def join_jam
		@attendance_params = params[:attendance]
		@skater = Skater.find session[:id]
		@jam = Jam.find params[:jam_id]
		@attendance = @jam.attendances.new
		@attendance.jam_id = @jam.id
		@attendance.skater_id = @skater.id
		@attendance.role = @attendance_params['role']

		if @attendance.save
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