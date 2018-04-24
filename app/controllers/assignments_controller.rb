class AssignmentsController < ApplicationController
	before_action :authenticate!

	def index
		@assignments = []
		@semester = Semester.find(params[:semester_id])

		Week.where(semester_id: params[:semester_id]).each do |w|
			@assignments.concat(Assignment.where(week_id: w.id))
		end
	end

	def new
		@assignment = Assignment.new
		@week = Week.find(params[:week_id])
	end

	def create
		week = Week.find(params[:week_id])
		semester = week.semester
		assignment = Assignment.create(assignment_params)
		assignment.week = week
		if assignment.save
			redirect_to semester_assignments_path semester_id: semester.id
		else
			puts week.errors.full_messages.to_sentence
			flash[:error] = week.errors.full_messages.to_sentence
			redirect_to new_week_assignment_path week_id: week.id
		end
	end

	def edit
		@assignment = Assignment.find(params[:id])
		@week = Week.find(params[:week_id])
	end

	def update
		assignment = Assignment.find(params[:id])
		assignment.update! assignment_params
		assignment.save

		week = Week.find(params[:week_id])
		redirect_to semester_assignments_path semester_id: week.semester_id
	end

	def destroy
		Assignment.find(params[:id]).destroy
		redirect_to semester_assignments_path semester_id: params[:semester_id]
	end

	private
	def assignment_params
		params.require(:assignment).permit(:link, :title, :due_date, :points, :description)
	end
end
