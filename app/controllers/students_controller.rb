class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @students = Student.all
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    student = Student.find(params[:id])
		student.update! student_params
		student.save
		redirect_to student_path params[:id]
  end

  # POST /students
  # POST /students.json
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

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:name).permit(:email, :picture)
    end
end
