class SupervisesController < ApplicationController
  before_action :set_supervise, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @supervises = Supervise.all
    respond_with(@supervises)
  end

  def show
    respond_with(@supervise)
  end

  def new
    @supervise = Supervise.new
    respond_with(@supervise)
  end

  def edit
  end

  def create
    @supervise = Supervise.new(supervise_params)
    flash[:notice] = 'Supervise was successfully created.' if @supervise.save
    respond_with(@supervise)
  end

  def update
    flash[:notice] = 'Supervise was successfully updated.' if @supervise.update(supervise_params)
    respond_with(@supervise)
  end

  def destroy
    @supervise.destroy
    respond_with(@supervise)
  end

  private
    def set_supervise
      @supervise = Supervise.find(params[:id])
    end

    def supervise_params
      params.require(:supervise).permit(:FID, :PID)
    end
end
