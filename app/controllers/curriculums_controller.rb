class CurriculumsController < ApplicationController
	def index
		@semester = Semester.find(params[:semester_id])
		@weeks = Week.where(semester_id: params[:semester_id]).sort_by {|week| week.week_number}
	end

	def show_week_creator
		@semester = Semester.find(params[:semester_id])
		render "week_creator"
	end

	def show_resource_creator
		@semester = Semester.find(params[:semester_id])
		@week = Week.find_by(
			semester_id: params[:semester_id],
			week_number: params[:week_number]
		)
		render "resource_creator"
	end

	def create_week
		week = Week.create(week_params)
		week.semester = Semester.find(params[:semester_id])
		if week.save
			puts "it worked!"
			redirect_to view_curriculum_path, id: params[:semester_id]
		else
			puts "It done broke"
			flash[:error] = week.errors.full_messages.to_sentence
			redirect_to view_curriculum_path, id: params[:semester_id]
		end
	end

	def create_resource
		resource = Resource.create(resource_params)
		resource.week = Week.find(params[:week_id])
		if resource.save
			puts "created a resource!"
			redirect_to view_curriculum_path, id: params[:semester_id]
		else
			puts "i fucked up"
			flash[:error] = resource.errors.full_messages.to_sentence
			redirect_to view_curriculum_path, id: params[:semester_id]
		end
	end

	def destroy_week
		Week.find_by(
			semester_id: params[:id],
			title: params[:week_title]
		).destroy
	end

	def destroy_resource
		week_id = Week.find_by(
			semester_id: params[:id],
			title: params[:week_title]
		).id
		Resource.find_by(
			week_id: week_id,
			title: params[:resource_title]
		).destroy
	end

	private

	def week_params
		params.require(:week).permit(:title, :date, :description, :week_number)
	end

	def resource_params
		params.require(:resource).permit(:link, :title, :week_title, :description)
	end
end
