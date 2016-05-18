class FacultiesController < ApplicationController
  before_action :set_faculty, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @faculties = Faculty.all
    respond_with(@faculties)
  end

  def show
    respond_with(@faculty)
  end

  def new
    @faculty = Faculty.new
    respond_with(@faculty)
  end

  def edit
  end

  def create
    @faculty = Faculty.new(faculty_params)
    flash[:notice] = 'Faculty was successfully created.' if @faculty.save
    respond_with(@faculty)
  end

  def update
    flash[:notice] = 'Faculty was successfully updated.' if @faculty.update(faculty_params)
    respond_with(@faculty)
  end

  def destroy
    @faculty.destroy
    respond_with(@faculty)
  end

  private
    def set_faculty
      @faculty = Faculty.find(params[:id])
    end

    def faculty_params
      params.require(:faculty).permit(:Name, :Area, :Email)
    end
end
