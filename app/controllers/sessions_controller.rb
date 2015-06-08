class SessionsController < ApplicationController
	def new		
	end

	def create
		@skater = Skater.find_by_email(params[:session][:email])

		if @skater && @skater.authenticate(params[:session][:password])
			session[:id] = @skater.id
			redirect_to '/'
		else
			redirect_to '/login'
		end
	end

	def destroy
		session[:id] = nil
		redirect_to '/'
	end
end