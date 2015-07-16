class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_skater, :pending_challenges, :completed_challenges

  def current_skater
	  @current_skater ||= Skater.find session[:id] if session[:id]
  end

  def require_skater
  	redirect_to '/login' unless current_skater
  end

  def pending_challenges
    if session[:id]
      @skater = Skater.find session[:id]
      @pending_challenges = @skater.challenges.where(state: 'pending').count
    end
  end

  def completed_challenges
    if session[:id]
      @skater = Skater.find session[:id]
      @challenges_completed = Challenge.where(skater_id: @skater.id).where(state: 'completed').count
    end
  end
end