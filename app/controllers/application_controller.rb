class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :ensure_logged_in

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to new_session_path
    end
  end

  def current_user
    if session[:user_id]
	   @current_user ||= User.find(session[:user_id])
    else
	   return nil
    end
  end

  helper_method :current_user

  def authenticate_user
  	unless current_user
  		redirect_to '/login'
  	end
  end

end
