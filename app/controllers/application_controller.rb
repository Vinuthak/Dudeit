class ApplicationController < ActionController::Base
  before_action :current_user
  
  protected
  def current_user
    return unless session[:user_id]
    #@current_user = User.where(id: session[:user_id]).first
    puts "I am current user"
    @current_user = User.find_by(id: session[:user_id])
  end

  def logged_in?
    !@current_user.nil?
  end

  def ensure_login
    return true if logged_in?
    session[:return_to] = fullpath.request
    redirect_to new_session_path and return false
  end

  helper_method :logged_in?
end
