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
      
      puts @result1
      puts @result2
      puts @result3
      puts @result4
      @result=@result1.merge(@result2).merge(@result3).merge(@result4)
      
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

