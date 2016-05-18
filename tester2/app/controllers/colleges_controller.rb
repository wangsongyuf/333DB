class CollegesController < ApplicationController
  before_action :set_college, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @colleges = College.all
    respond_with(@colleges)
  end

  def show
    respond_with(@college)
  end

  def new
    @college = College.new
    respond_with(@college)
  end

  def edit
  end

  def create
    @college = College.new(college_params)
    flash[:notice] = 'College was successfully created.' if @college.save
    respond_with(@college)
  end

  def update
    flash[:notice] = 'College was successfully updated.' if @college.update(college_params)
    respond_with(@college)
  end

  def destroy
    @college.destroy
    respond_with(@college)
  end

  private
    def set_college
      @college = College.find(params[:id])
    end

    def college_params
      params.require(:college).permit(:Name, :Ranking, :Tuition, :FundingOption, :AverageStandardizedTestScore, :InState, :AtAddress)
    end
end
