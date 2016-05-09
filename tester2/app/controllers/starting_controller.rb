class StartingController < ApplicationController
  
  before_action :require_user, :index

  @@table = Array.new(4) { Hash.new }
  @@tb = Hash.new()
  def start
    if params[:commit] == "Search"
      @connection = ActiveRecord::Base.connection
      @st='exec search '
      if params[:starting][:College].empty?
        @st=@st+'@college = null,'
      else
        @st=@st+'@college = '+'\'"'+params[:starting][:College]+'"\''+','
      end
        if params[:starting][:Department].empty?
        @st=@st+'@department = null,'
      else
        @st=@st+'@department = '+'\'"'+params[:starting][:Department]+'"\''+','
      end
      if params[:starting][:Program].empty?
        @st=@st+'@program = null,'
      else
        @st=@st+'@program = '+'\'"'+params[:starting][:Program]+'"\''+','
      end
      if params[:starting][:Faculty].empty?
        @st=@st+'@faculty = null'
      else
        @st=@st+'@faculty = '+'\'"'+params[:starting][:Faculty]+'"\''
      end
      @result = @connection.exec_query(@st)
      
      count = 0
      @result.each do |p|
        p.each do |k , v|
          if k.is_a?(Array) && !(v.nil?)
            vcount = 0
            k.each do |key|
              @@table[count][key] = v[vcount]
              vcount = vcount + 1
            end
            count = count + 1
          elsif (!k.is_a?(Array)) && !(v.nil?)
            @@tb[k] = v
          end
        end
      end
      
      if !@@table.empty? 
        @rslt = Array.new(4)
        @rslt.push(@@table)
        @rslt.flatten!
      end
      
      if !@@tb.empty?
        @rslt = Hash.new()
        @rslt.merge!(@@tb)
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

