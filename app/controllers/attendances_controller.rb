class AttendancesController < ApplicationController
  def index
    @student = Student.find(params[:student_id])
    @semester = Semester.find(@student.semester_id)
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
