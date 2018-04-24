class WeeksController < ApplicationController
	before_action :authenticate!

	def create
		week = Week.create(week_params)
		week.semester_id = params[:semester_id]
		if week.save
			redirect_to semester_path params[:semester_id]
		else
			flash[:error] = week.errors.full_messages.to_sentence
			redirect_to new_semester_week_path, semester_id: params[:semester_id]
		end
	end

	def update
		week = Week.find(params[:id])
		week.update! week_params
		week.save

		redirect_to semester_path params[:semester_id]
	end

	def destroy
		semester = Semester.find(params[:semester_id])
		week = Week.find(params[:id])
		week.destroy
		redirect_to semester
	end

	private
	def week_params
		params.require(:week).permit(:title, :date, :description, :week_number)
	end
end
