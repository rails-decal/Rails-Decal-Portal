class AssignmentsController < ApplicationController
	before_action :authenticate!

	def index
		@assignments = []
		@semester = Semester.find(params[:semester_id])
		@week_numbers = []

		Week.where(semester_id: params[:semester_id]).each do |w|
			@week_numbers.push(w.week_number)
			@assignments.concat(Assignment.where(week_id: w.id))
		end
	end

	def create
		semester = Semester.find(params[:semester_id])
		week = Week.where({
			semester_id: semester.id, 
			week_number: params[:assignment][:week_number]
		})[0]
		assignment = Assignment.create(assignment_params)
		assignment.week_id = week.id
		if assignment.save
			redirect_to semester_assignments_path semester_id: week.semester_id
		else
			puts week.errors.full_messages.to_sentence
			flash[:error] = week.errors.full_messages.to_sentence
			redirect_to new_week_assignment_path, week_id: week.id
		end
	end

	def update
		assignment = Assignment.find(params[:id])
		semester = Week.find(params[:week_id]).semester

		week = Week.where({
			semester_id: semester.id, 
			week_number: params[:assignment][:week_number]
		})[0]
		assignment.update! assignment_params
		assignment.week = week

		assignment.save
		redirect_to semester_assignments_path semester_id: semester.id
	end

	def destroy
		Assignment.find(params[:id]).destroy
		redirect_to semester_assignments_path semester_id: params[:semester_id]
	end

	private
	def assignment_params
		params.require(:assignment).permit(:link, :title, :due_date, :points, :description, :week_number)
	end
end
