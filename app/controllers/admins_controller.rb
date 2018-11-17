class AdminsController < ApplicationController
	before_action :authenticate!

	def index
		@semester = Semester.latest
		@admins = Admin.where(active: true).sort_by { |x| x.created_at }
	end

end
