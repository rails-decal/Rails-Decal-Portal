class StudentsController < ApplicationController
	before_action :authenticate!

	def index
		@students = Student.where(semester_id: params[:semester_id])
		@semester = Semester.find(params[:semester_id])
	end

	def show
		#Disallowing admin hax
		if is_admin
			puts "Admins can't access dashboard pages"
			redirect_to semester_students_path(semester_id: params[:semester_id])
			return
		end
		#Disallowing hax
		if params[:id].to_s != @current_user.id.to_s or @current_user.semester.id.to_s != params[:semester_id].to_s
			puts "students must access proper semester and user"
			redirect_to semester_student_path(semester_id: @current_user.semester.id, id: @current_user.id)
			return
		end
		puts "Showing dashboard for " + @current_user.name + " and semester " + params[:semester_id].to_s
		now = DateTime.now

		@semester = Semester.find(params[:semester_id])
		assignments = Assignment.where("due_date >= :date", date: now).select { |a| a.semester.id == @semester.id }.sort_by(&:due_date)
		@assignment = assignments.count > 0 ? assignments.first : nil
		weeks = Week.where("date <= :date", date: now).select {|w| w.semester.id == @semester.id}.sort_by(&:date)
		@week = weeks.count > 0 ? weeks.last : nil

		@attendance_num = 0

		# TODO: View Needs to handle empty state for attendance weeks
		weeks.each do |week|
			attendance = week.attendances.where(student_id: @current_user.id)
			unless attendance.empty?
				attendance = attendance.last
				if attendance.status == "present" || attendance.status == "excused"
					@attendance_num += 1
				end
			end
		end

		@attendance_denom = weeks.size

		@attendance_week = weeks.last
		if @attendance_week
			@attendance = @current_user.attendances.where(week_id: @attendance_week.id)
			@attendance = @attendance.empty? ? nil : @attendance.last
		else
			@attendance = nil
		end
		submissions = Submission.where(graded: true).select {|s| s.students.include? @current_user.id }.sort_by(&:updated_at)
		@graded_assignment = submissions.count > 0 ? submissions.last : nil
		@all_graded = @current_user.submissions.where(graded: true)
	end
end
