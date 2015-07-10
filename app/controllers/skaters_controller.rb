class SkatersController < ApplicationController
	def index
		@skaters = Skater.all
		
		respond_to do |format|
			format.html
			format.json { render json: @skaters }
		end
	end
	def new
		@skater = Skater.new
	end

	def create
		@skater = Skater.new skater_params

		if @skater.save
			session[:id] = @skater.id
			redirect_to '/'
		else
			render 'new'
		end
	end

	private
	def skater_params
		params.require(:skater).permit(:name, :email, :password)
	end
end