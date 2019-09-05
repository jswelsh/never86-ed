class SessionsController < ApplicationController
  before_action :require_login, only: %w[destroy]
  def new
    @session = User.new
  end

  def create
    @user = User.find_by_email(session_params[:email])
    if @user&.authenticate(session_params[:password])
      log_in @user
      redirect_to bars_path
    else
      @session = User.new(session_params)
      render :new
    end
  end
  

  def destroy
    logout
    redirect_to welcome_path
  end

private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
