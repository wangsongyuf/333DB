
class UsersController < ApplicationController
  def signup
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @current_user
      redirect_to '/start'
    else
      @user = User.new
    end
  end
  
  def create 
    @user = User.new(user_params) 
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to '/start' 
    else 
      if params[:commit] == "Go to Main"
        redirect_to '/'
      else
        render 'signup'
      end
    end 
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end
  
end
