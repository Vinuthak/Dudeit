class ApplicationController < ActionController::Base
  before_action :current_user
  
  protected
  def current_user
    return unless session[:user_id]
    @current_user = User.where(id: session[:user_id]).first
  end
end
