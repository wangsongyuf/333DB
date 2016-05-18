class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @programs = Program.all
    respond_with(@programs)
  end

  def show
    respond_with(@program)
  end

  def new
    @program = Program.new
    respond_with(@program)
  end

  def edit
  end

  def create
    @program = Program.new(program_params)
    flash[:notice] = 'Program was successfully created.' if @program.save
    respond_with(@program)
  end

  def update
    flash[:notice] = 'Program was successfully updated.' if @program.update(program_params)
    respond_with(@program)
  end

  def destroy
    @program.destroy
    respond_with(@program)
  end

  private
    def set_program
      @program = Program.find(params[:id])
    end

    def program_params
      params.require(:program).permit(:Name, :USNewsRanking, :PrincetonReviewRanking, :CID, :DID)
    end
end
