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

=begin
class SkatersController < ApplicationController
	def index
		@skaters = Skater.all
		
		respond_to do |format|
			format.html
			format.json { render json: @skaters }
		end
	end

	def create
		@new_skater_params = params[:newSkater]
		@skater = Skater.new
		@skater.name = @new_skater_params["nickname"]
		@skater.email = @new_skater_params["nickname"]
		@skater.password = @new_skater_params["password"]

		if @skater.save
			session[:id] = @skater.id
			redirect_to '/'
		else
			redirect_to '/jams'
		end
	end
end
=end