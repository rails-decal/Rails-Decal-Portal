class ResourcesController < ApplicationController
	before_action :authenticate!

	def create
		resource = Resource.create(resources_params)
		week = Week.find(params[:week_id])
		resource.week = week

		if resource.save
			flash[:notice] = "New resource created"
		else
			flash[:alert] = "Could not create resource"
		end
		semester_id = week.semester_id
		redirect_to semester_path id: semester_id
	end

	def update
		resource = Resource.find(params[:id])
		resource.update! resources_params
		
		if resource.save
			flash[:notice] = "Resource changes saved"
		else
			flash[:alert] = "Could not save changes"
		end
		semester_id = resource.week.semester_id
		redirect_to semester_path id: semester_id
	end

	def destroy
		Resource.find(params[:id]).destroy!
		flash[:alert] = "Resource deleted succesfully"
		redirect_to semester_path id: Week.find(params[:week_id]).semester_id
	end

	private
	def resources_params
		params.require(:resource).permit(:link, :title, :description)
	end
end
