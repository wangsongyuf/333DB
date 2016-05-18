class FRatesController < ApplicationController
  before_action :set_f_rate, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @f_rates = FRate.all
    respond_with(@f_rates)
  end

  def show
    respond_with(@f_rate)
  end

  def new
    @f_rate = FRate.new
    respond_with(@f_rate)
  end

  def edit
  end

  def create
    @f_rate = FRate.new(f_rate_params)
    flash[:notice] = 'FRate was successfully created.' if @f_rate.save
    respond_with(@f_rate)
  end

  def update
    flash[:notice] = 'FRate was successfully updated.' if @f_rate.update(f_rate_params)
    respond_with(@f_rate)
  end

  def destroy
    @f_rate.destroy
    respond_with(@f_rate)
  end

  private
    def set_f_rate
      @f_rate = FRate.find(params[:id])
    end

    def f_rate_params
      params.require(:f_rate).permit(:FID, :UUID, :Rating, :Comment)
    end
end
