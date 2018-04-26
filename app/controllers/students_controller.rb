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

		attendance_weeks = Week.where("date <= :date", date: DateTime.now).order(:date)
		@attendance_num = 0

		attendance_weeks.each do |week|
			attendance = week.attendances.where(student_id: @current_user.id)
			unless attendance.empty?
				attendance = attendance.last
				if attendance.status == "present" || attendance.status == "excused"
					@attendance_num += 1
				end
			end
		end

		@attendance_denom = attendance_weeks.size

		@attendance_week = attendance_weeks.last
		@attendance = @current_user.attendances.where(week_id: @attendance_week.id)
		@attendance = @attendance.empty? ? nil : @attendance.last

		@graded_assignment = Submission.where(graded: true).order(:updated_at).last
		@all_graded = @current_user.submissions.where(graded: true)
	end
end
