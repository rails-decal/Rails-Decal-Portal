class StudentsController < ApplicationController
	before_action :authenticate!

	def index
		@students = Student.where(semester_id: params[:semester_id])
		@semester = Semester.find(params[:semester_id])
	end
end
