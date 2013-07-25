class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :login?

  helper_method :current_user
  
  def login?
  	redirect_to new_login_path unless auth?
  end

  def auth?
  	!!current_user
  end

  def current_user
  	@user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
end