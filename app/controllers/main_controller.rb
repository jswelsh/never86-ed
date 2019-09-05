class MainController < ApplicationController
  def home
    if logged_in?
      redirect_to bars_path
    else
      redirect_to welcome_path
    end
  end

  def welcome
  end
end
