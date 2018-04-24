class SemestersController < ApplicationController
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
