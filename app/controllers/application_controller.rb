class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||=  User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user  # check the user is logged in or not and return in boolean value, true or false
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must have to login to perform this action..."
      redirect_to root_path
    end
  end
end 
