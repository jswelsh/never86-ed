class ApplicationController < ActionController::Base

  def log_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = session[:user_id] ? User.find(session[:user_id]) : nil
  end
  
  def logged_in?
    !!current_user 
  end

  def logout
    reset_session
    @current_user = nil
  end

  def require_login
    redirect_to login_path unless logged_in?
  end

end
