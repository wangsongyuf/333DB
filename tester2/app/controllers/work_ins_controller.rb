class WorkInsController < ApplicationController
  before_action :set_work_in, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @work_ins = WorkIn.all
    respond_with(@work_ins)
  end

  def show
    respond_with(@work_in)
  end

  def new
    @work_in = WorkIn.new
    respond_with(@work_in)
  end

  def edit
  end

  def create
    @work_in = WorkIn.new(work_in_params)
    flash[:notice] = 'WorkIn was successfully created.' if @work_in.save
    respond_with(@work_in)
  end

  def update
    flash[:notice] = 'WorkIn was successfully updated.' if @work_in.update(work_in_params)
    respond_with(@work_in)
  end

  def destroy
    @work_in.destroy
    respond_with(@work_in)
  end

  private
    def set_work_in
      @work_in = WorkIn.find(params[:id])
    end

    def work_in_params
      params.require(:work_in).permit(:FID, :DID)
    end
end
