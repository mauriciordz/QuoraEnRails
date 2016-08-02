class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :current_user

  protect_from_forgery with: :exception

  def current_user
    if session[:id]
      @current_user ||= User.find_by_id(session[:id])
    end
  end

  def logged_in?
    !current_user.nil?
  end


  helper_method :logged_in?
  helper_method :current_user

end
