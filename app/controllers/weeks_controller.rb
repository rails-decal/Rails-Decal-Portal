class WeeksController < ApplicationController
	before_action :authenticate!

	def create
		week = Week.create(week_params)
		week.semester_id = params[:semester_id]
		if week.save
			flash[:notice] = "Week created!"
			redirect_to semester_path params[:semester_id]
		else
			flash[:error] = week.errors.full_messages.to_sentence
			redirect_back(fallback_location: root_path)
		end
	end

	def update
		week = Week.find(params[:id])
		week.update! week_params
		if week.save
			flash[:notice] = "Changes saved"
		else
			flash[:error] = week.errors.full_messages.to_sentence
		end
		redirect_to semester_path params[:semester_id]
	end

	def destroy
		semester = Semester.find(params[:semester_id])
		week = Week.find(params[:id])
		if week.destroy
			flash[:alert] = "Week succesfully deleted"
		else
			flash[:error] = "Can't delete week"
		end
		redirect_to semester
	end

	private
	def week_params
		params.require(:week).permit(:title, :date, :description, :week_number, :attendance_word)
	end
end
