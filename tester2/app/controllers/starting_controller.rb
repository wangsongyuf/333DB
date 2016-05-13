class StartingController < ApplicationController

  before_action :require_user, :index

  @@table = Array.new(4) { Hash.new }
  @@tb = Hash.new()

  def start
    if params[:commit] == "Search"
      @connection = ActiveRecord::Base.connection
      if !params[:starting][:College].empty?
        @st1='exec searchcollege '+'@college ='+'\'"'+params[:starting][:College]+'"\''
        @result1 = @connection.exec_query(@st1)
      else @result1
      end
      if !params[:starting][:Department].empty?
        @st2='exec searchdepartment '+'@department = '+'\'"'+params[:starting][:Department]+'"\''
        @result2 = @connection.exec_query(@st2)
      else @result2
      end
      if !params[:starting][:Program].empty?
        @st3='exec searchprogram '+'@program = '+'\'"'+params[:starting][:Program]+'"\''
        @result3 = @connection.exec_query(@st3)
      else @result3
      end
      if !params[:starting][:Faculty].empty?
        @st4='exec searchfaculty '+'@faculty = '+'\'"'+params[:starting][:Faculty]+'"\''
        @result4 = @connection.exec_query(@st4)
      else @result4
      end

      render :results
    end
  end

  def index

  end

  def results
    @rslt = Array.new(4)
    @rslt.push(@@table)
    puts @rslt
  end
end

