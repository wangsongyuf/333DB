class StartingController < ApplicationController
  
  before_action :require_user, only: [:index, :start]
  
  def start
  end

  def index
  end
end
