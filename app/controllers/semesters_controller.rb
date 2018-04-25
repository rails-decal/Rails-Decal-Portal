class SemestersController < ApplicationController
	before_action :set_current_user

	def set_current_user
		@current_user = get_current_user
	end
	def index
		redirect_to controller: 'semesters', action: 'show', id: 1
	end

	def create
	end

	def new
	end

	def edit
	end

	def show
		@semester = Semester.find(params[:id])
	end

	def destroy
	end
end
