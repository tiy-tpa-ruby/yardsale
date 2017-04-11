class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Returns the current user if logged in
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  # Method to use in a filter to ensure the user is logged in
  def authorize!
    redirect_to login_path unless logged_in?
  end
end
