class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # just show a flash message instead of full CanCan exception
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "You are not authorized to take this action."
    redirect_to home_path
  end

  # handle 404 errors with an exception as well
  rescue_from ActiveRecord::RecordNotFound do |exception|
    flash[:error] = "Seek and you shall find... but not this time"
    redirect_to home_path
  end

  private
  # Handling authentication
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def nav_cats
    @nav_cats ||= Category.active.all
  end
  helper_method :nav_cats

  def nav_subcats
    @nav_subcats ||= Subcat.active
  end
  helper_method :nav_subcats
  
  def logged_in?
    current_user
  end
  helper_method :logged_in?
  
  def check_login
    redirect_to login_path, alert: "You need to log in to view this page." if current_user.nil?
  end

end
