
class UsersController < ApplicationController
  def signup
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      @current_user = nil;
    end 
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
  
  def profile
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      @current_user = nil;
    end 
    @connection = ActiveRecord::Base.connection
    @st='exec ProfilePages '
    if @current_user
      @st = @st + '@username = ' + '\'' + @current_user.username + '\''
    else
      redirect_to '/'
    end
    @result = @connection.exec_query(@st)
  end
  
  def destroy_account
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      @current_user = nil;
    end 
    @connection = ActiveRecord::Base.connection
    @st='exec AbortUser '
    if @current_user
      @st = @st + '@username = ' + '\'' + @current_user.username + '\''
    else
      redirect_to '/'
    end
    @result = @connection.exec_query(@st)
    redirect_to '/'
  end
  
  def modifyCurrentStatus
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      @current_user = nil;
    end 
    @connection = ActiveRecord::Base.connection
    @st='exec UpdateUserCurrentStatus '
    if params[:commit] == "Modify"
        if @current_user
          @st = @st + '@username = ' + '\'' + @current_user.username + '\'' + ','
        else
          redirect_to '/'
        end
        @st = @st + '@currentStatus = ' + '\'' + params[:status][:currentStatus] + '\''
        @result = @connection.exec_query(@st)
        puts @result
        redirect_to '/profile'
    elsif params[:commit] == "Go to Main"
      redirect_to '/'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end
  
end
