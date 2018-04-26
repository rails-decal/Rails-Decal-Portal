class SemestersController < ApplicationController

	def index
		authenticate_admin!
		if params[:semester_id]
			@semester = Semester.find(params[:semester_id])
		end
		@semesters = Semester.all.sort_by(&:created_at)
	end

	def latest
		sorted = Semester.all.sort_by {|x| [x.active ? 1 : 0, x.created_at] }
		if sorted.count == 0
			render 'create'
		else
			redirect_to controller: 'semesters', action: 'show', id: sorted.last.id
		end
	end

	def create
		authenticate_admin!
	end

	def activate
		authenticate_admin!
		Semester.all.each { |e|
			puts e.id.to_s == params[:id]
			e.active = e.id.to_s == params[:id]
			e.save!
		}
		redirect_to controller: 'semesters', action: 'show', id: params[:id]
	end

	def new
	end

	def edit
	end

	def show
		@semester = Semester.find(params[:id])
	end

	def destroy
		semester = Semester.find(params[:id])
		semester.destroy
		flash[:alert] = "Semester Succesfully deleted"
		redirect_to '/'
	end
end
