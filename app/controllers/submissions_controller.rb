class SubmissionsController < ApplicationController
	before_action :authenticate!

	def index
		# Shows submissions that are assigned to the grader
		@submissions = Submission.where(admin_id: @current_user.id).where.not(graded: true)
		@semester = Semester.find(params[:semester_id])
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

	def update
		submission = Submission.find(params[:id])
		submission.update! submission_params
		semester = submission.assignment.week.semester
		if params[:submission][:score] != nil
			submission.graded = true
			return_path = semester_submissions_path(semester_id: semester.id)
		else
			submission.date = DateTime.now
			return_path = semester_assignments_path(semester_id: semester.id)
		end

		submission.save

		redirect_to return_path
	end

	def destroy
		Submission.find(params[:id]).destroy

		semester_id = Week.find_by(assignment_id: params[:assignment_id]).semester_id
		redirect_to semester_assignments_path semester_id: semester_id
	end

	private
	def submission_params
		params.require(:submission).permit(:link, :score, :comment)
	end

end
