class StudentsController < ApplicationController
	before_action :authenticate!

	def index
		@students = Student.where(semester_id: params[:semester_id])
		@semester = Semester.find(params[:semester_id])
	end

	def show
		now = DateTime.now
		@semester = Semester.find(params[:semester_id])
		@assignment = Assignment.where("due_date >= :date", date: now).order(:due_date).first
		@week = @assignment.week
		@attendance = nil # todo: update this
		@graded_assignment = Submission.where(graded: true).order(:updated_at).last
		@all_graded = @current_user.submissions.where(graded: true)
	end
end
