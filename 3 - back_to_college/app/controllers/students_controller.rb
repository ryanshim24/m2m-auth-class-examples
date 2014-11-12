class StudentsController < ApplicationController
before_action :set_student, only: [:show, :edit, :update, :destroy]
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student, notice: "Student was created"
    end
  end

  def show
  end

  def edit
  end

  def enroll

  end

  # Don't do this yet....
  def create_enrollment

  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html {redirect_to @student, notice: 'Book was successful'}
      end
    end
  end

  def destroy
    @student.destroy
    redirect_to students_url, notice: "Student was destroeyd"
  end

  private
  def set_student 
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit!
  end
end
