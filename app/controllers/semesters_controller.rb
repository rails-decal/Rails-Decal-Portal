class SemestersController < ApplicationController
	#before_action :authenticate_student!
	def index
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
