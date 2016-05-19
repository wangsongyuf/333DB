class WelcomeController < ApplicationController
  def index
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      @current_user = nil;
    end 
    if @current_user
      redirect_to '/start'
    end
  end
end
