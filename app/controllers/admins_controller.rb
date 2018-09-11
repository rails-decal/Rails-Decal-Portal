class AdminsController < ApplicationController
	before_action :authenticate!

	def index
		sorted = Semester.all.sort_by {|x| [x.active ? 1 : 0, x.created_at] }
		@semester = sorted.last
		@admins = Admin.where(active: true)
	end

end
