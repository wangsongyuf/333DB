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
      redirect_to '/start'
    end
  end

  def modifyEmail
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      @current_user = nil;
    end
    @connection = ActiveRecord::Base.connection
    @st='exec UpdateUserEmail '
    if params[:commit] == "Modify"
      if @current_user
        @st = @st + '@username = ' + '\'' + @current_user.username + '\'' + ','
      else
        redirect_to '/'
      end
      @st = @st + '@email = ' + '\'' + params[:status][:email] + '\''
      @result = @connection.exec_query(@st)
      puts @result
      redirect_to '/profile'
    elsif params[:commit] == "Go to Main"
      redirect_to '/start'
    end
  end

  def modifyFirstName
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      @current_user = nil;
    end
    @connection = ActiveRecord::Base.connection
    @st='exec UpdateUserFirstName '
    if params[:commit] == "Modify"
      if @current_user
        @st = @st + '@username = ' + '\'' + @current_user.username + '\'' + ','
      else
        redirect_to '/'
      end
      @st = @st + '@FirstName = ' + '\'' + params[:status][:first_name] + '\''
      @result = @connection.exec_query(@st)
      puts @result
      redirect_to '/profile'
    elsif params[:commit] == "Go to Main"
      redirect_to '/start'
    end
  end

  def modifyLastName
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      @current_user = nil;
    end
    @connection = ActiveRecord::Base.connection
    @st='exec UpdateUserLastName '
    if params[:commit] == "Modify"
      if @current_user
        @st = @st + '@username = ' + '\'' + @current_user.username + '\'' + ','
      else
        redirect_to '/'
      end
      @st = @st + '@LastName = ' + '\'' + params[:status][:last_name] + '\''
      @result = @connection.exec_query(@st)
      puts @result
      redirect_to '/profile'
    elsif params[:commit] == "Go to Main"
      redirect_to '/start'
    end
  end

  def modifyUsername
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      @current_user = nil;
    end
    @connection = ActiveRecord::Base.connection
    @st='exec UpdateUserUsername '
    if params[:commit] == "Modify"
      if @current_user
        @st = @st + '@username = ' + '\'' + @current_user.username + '\'' + ','
      else
        redirect_to '/'
      end
      @st = @st + '@Username2 = ' + '\'' + params[:status][:username] + '\''
      @result = @connection.exec_query(@st)
      puts @result
      redirect_to '/profile'
    elsif params[:commit] == "Go to Main"
      redirect_to '/start'
    end
  end

  def modifyYear
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      @current_user = nil;
    end
    @connection = ActiveRecord::Base.connection
    @st='exec UpdateUserYear '
    if params[:commit] == "Modify"
      if @current_user
        @st = @st + '@username = ' + '\'' + @current_user.username + '\'' + ','
      else
        redirect_to '/'
      end
      @st = @st + '@year = ' + '\'' + params[:status][:year] + '\''
      @result = @connection.exec_query(@st)
      puts @result
      redirect_to '/profile'
    elsif params[:commit] == "Go to Main"
      redirect_to '/start'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end

end
