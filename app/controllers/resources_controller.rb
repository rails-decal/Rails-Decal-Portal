class ResourcesController < ApplicationController
	def new
		@resource = Resource.new
		@week = Week.find(params[:week_id])
	end

	def create
		resource = Resource.create(resources_params)
		week = Week.find(params[:week_id])
		resource.week = week

		if resource.save
			semester_id = week.semester_id
			redirect_to semester_path id: semester_id
		else

		end
	end

	def edit
		@resource = Resource.find(params[:id])
		@week = Week.find(params[:week_id])
	end

	def update
		resource = Resource.find(params[:id])
		resource.update! resources_params
		resource.save

		semester_id = resource.week.semester_id
		redirect_to semester_path id: semester_id
	end

	def destroy
		Resource.find(params[:id]).destroy!
		redirect_to semester_path id: Week.find(params[:week_id]).semester_id
	end

	private
	def resources_params 
		params.require(:resource).permit(:link, :title, :description)
	end 
end
