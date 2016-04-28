class SessionsController < ApplicationController
  def login
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @current_user
      redirect_to '/start'
    end
  end
  
  def create
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @current_user
      redirect_to '/start'
    else
      @user = User.find_by_username(params[:session][:username])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to '/start'
      else
        if params[:commit] == "Go to Main"
          redirect_to '/'
        else
          redirect_to '/login' 
        end
      end
    end 
  end
  
  def destroy 
    session[:user_id] = nil 
    redirect_to '/' 
  end
  
end
