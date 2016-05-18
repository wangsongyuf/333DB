class CRatesController < ApplicationController
  before_action :set_c_rate, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @c_rates = CRate.all
    respond_with(@c_rates)
  end

  def show
    respond_with(@c_rate)
  end

  def new
    @c_rate = CRate.new
    respond_with(@c_rate)
  end

  def edit
  end

  def create
    @c_rate = CRate.new(c_rate_params)
    flash[:notice] = 'CRate was successfully created.' if @c_rate.save
    respond_with(@c_rate)
  end

  def update
    flash[:notice] = 'CRate was successfully updated.' if @c_rate.update(c_rate_params)
    respond_with(@c_rate)
  end

  def destroy
    @c_rate.destroy
    respond_with(@c_rate)
  end

  private
    def set_c_rate
      @c_rate = CRate.find(params[:id])
    end

    def c_rate_params
      params.require(:c_rate).permit(:CID, :UUID, :Rating, :Comment)
    end
end
