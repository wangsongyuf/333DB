class StartingController < ApplicationController

  before_action :require_user, :index

  @@table = Array.new(5)
  @@tb = Hash.new()

  def start
     @connection = ActiveRecord::Base.connection
     @@table = Array.new(5)
    if params[:commit] == "Search"
      if !params[:starting][:College].empty?
        @st1='exec searchcollege '+'@college ='+'\'"'+params[:starting][:College]+'"\''
        @result1 = @connection.exec_query(@st1)
        @@table.push(@result1)
      else @@table.push(Hash.new())
      end
      if !params[:starting][:Department].empty?
        @st2='exec searchdepartment '+'@department = '+'\'"'+params[:starting][:Department]+'"\''
        @result2 = @connection.exec_query(@st2)
        @@table.push(@result2)
      else @@table.push(Hash.new())
      end
      if !params[:starting][:Program].empty?
        @st3='exec searchprogram '+'@program = '+'\'"'+params[:starting][:Program]+'"\''
        @result3 = @connection.exec_query(@st3)
        @@table.push(@result3)
      else @@table.push(Hash.new())
      end
      if !params[:starting][:Faculty].empty?
        @st4='exec searchfaculty '+'@faculty = '+'\'"'+params[:starting][:Faculty]+'"\''
        @result4 = @connection.exec_query(@st4)
        @@table.push(@result4)
      else @@table.push(Hash.new())
      end
      redirect_to '/results'
      
      else if params[:commit] == "Check College With Rank"
           if !params[:starting][:start].empty? and !params[:starting][:end].empty?
              @st5='exec ranksearchcollege '+'@start = '+params[:starting][:start]+','
              @st5=@st5+'@end = '+params[:starting][:end]
        @result5 = @connection.exec_query(@st5)
        @@table[0,4] = [Hash.new(), Hash.new(), Hash.new(), Hash.new()]
        @@table.push(@result5)
        end
        redirect_to '/results'
    end
    
    end
  end

  def index

  end

  def results
    @rslt = Array.new(5)
    count = 0
    @@table.compact.each do |item|
      @rslt[count] = item
      count = count + 1
    end
    @result1 = @rslt[0]
    @result2 = @rslt[1]
    @result3 = @rslt[2]
    @result4 = @rslt[3]
    @result5 = @rslt[4]
  end
end

