class AdminsController < ApplicationController
	before_action :authenticate!

	def index
		@semester = Semester.latest
		@admins = Admin.where(active: true).sort_by { |x| x.created_at }
	end

	def grading
		a = Assignment.last
		@assignment_failure = Student.all.select {|s| s.submissions.select {|sub| sub.assignment = a}.count == 0}
		@attendance_failure = Student.all.select {|s| s.attendances.count < 6}
		@both = @assignment_failure & @attendance_failure
	end

end
