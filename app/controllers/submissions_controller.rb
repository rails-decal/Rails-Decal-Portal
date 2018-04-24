class SubmissionsController < ApplicationController
	before_action :authenticate!

	def new
		@assignment = Assignment.find(params[:assignment_id])
		@submission = Submission.new
	end

	def create
		puts params
		assignment = Assignment.find(params[:assignment_id])
		submission = Submission.create(submission_params)
		submission.assignment = assignment
		submission.date = DateTime.now
		submission.admin = Admin.find(Submission.last.id % Admin.count + 1)
		student = Student.find(params[:student_id])
		submission.students.push(student)
		semester_id = Week.find(assignment.week_id).semester_id
		if submission.save
			redirect_to semester_assignments_path semester_id: semester_id
		else
			flash[:error] = resource.errors.full_messages.to_sentence
			redirect_to new_assignment_submission(params[:assignment_id])
		end
	end

	def edit
		@assignment = Assignment.find(params[:assignment_id])
		@submission = Submission.find(params[:id])
	end

	def update
		submission = Submission.find(params[:id])
		submission.update! submission_params
		submission.date = DateTime.now

		submission.save

		assignment = Assignment.find(params[:assignment_id])
		semester_id = Week.find(assignment.week_id).semester_id
		redirect_to semester_assignments_path semester_id: semester_id
	end

	def destroy
		Submission.find(params[:id]).destroy

		semester_id = Week.find_by(assignment_id: params[:assignment_id]).semester_id
		redirect_to semester_assignments_path semester_id: semester_id
	end

	private
	def submission_params
		params.require(:submission).permit(:link)
	end

end
