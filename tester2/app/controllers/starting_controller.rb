class StartingController < ApplicationController
  
  before_action :require_user, only: [:index, :start]
  
  @@table = Hash.new()
    
  def start
    if params[:commit] == "Search"
      @connection = ActiveRecord::Base.connection
      @st='exec search '
      if params[:starting][:College].empty?
        @st=@st+'@college = null,'
      else
        @st=@st+'@college = '+'\''+params[:starting][:College]+'\''+','
      end
        if params[:starting][:Department].empty?
        @st=@st+'@department = null,'
      else
        @st=@st+'@department = '+'\''+params[:starting][:Department]+'\''+','
      end
      if params[:starting][:Program].empty?
        @st=@st+'@program = null,'
      else
        @st=@st+'@program = '+'\''+params[:starting][:Program]+'\''+','
      end
      if params[:starting][:Faculty].empty?
        @st=@st+'@faculty = null'
      else
        @st=@st+'@faculty = '+'\''+params[:starting][:Faculty]+'\''
      end
      @result = @connection.exec_query(@st)
     
      @@table.merge!(@result[0])
          
      redirect_to '/results'
    end
  end

  def index
    
  end
  
  def results
    @test = Hash.new
    @test.merge!(@@table)
  end
  end

