class StudentsController < ApplicationController

  def show
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def edit
    student = Student.find(params[:id])
		student.update! student_params
		student.save
		redirect_to student_path params[:id]
  end

  def create
    student = Student.create(student_params)
		student.semester_id = params[:semester_id]
		if student.save
			redirect_to student_path params[:id]
		else
			flash[:error] = week.errors.full_messages.to_sentence
			redirect_to new_semester_week_path, semester_id: params[:semester_id]
		end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def profile
    @student = Student.find(params[:id])

  private
    def student_params
      params.require(:name).permit(:email, :picture)
    end
end
