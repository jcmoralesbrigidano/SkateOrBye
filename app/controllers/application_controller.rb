class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_skater

  def current_skater
	@current_skater ||= Skater.find(session[:id]) if session[:id]
  end

  def require_skater
  	redirect_to '/login' unless current_skater
  end
end