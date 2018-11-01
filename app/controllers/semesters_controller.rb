class SemestersController < ApplicationController

	def index
		authenticate_admin!
		if params[:semester_id]
			@semester = Semester.find(params[:semester_id])
		end
		@semesters = Semester.all.sort_by(&:created_at)
	end

	def latest
		if user_signed_in && !is_admin
			redirect_to semester_student_path(semester_id: @current_user.semester.id, id: @current_user.id)
		else
			sorted = Semester.all.sort_by {|x| [x.active ? 1 : 0, x.created_at] }
			if sorted.count == 0
				render 'create'
			else
				redirect_to controller: 'semesters', action: 'show', id: sorted.last.id
			end
		end
	end

	def create
		authenticate_admin!
		semester = Semester.create(semester_params)
		if semester.save
			flash[:notice] = "Semester successfully created!"
			redirect_to semester_path semester.id
		else
			flash[:alert] = semester.errors.full_messages.to_sentence
			redirect_back(fallback_location: root_path)
		end
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

	def update
		authenticate_admin!
		semester = Semester.find(params[:id])
		semester.update! semester_params
		if semester.save
			flash[:notice] = "Changes saved"
		else
			flash[:error] = semester.errors.full_messages.to_sentence
		end
		redirect_back(fallback_location: root_path)
	end

	def show
		@semester = Semester.find(params[:id])
	end

	def destroy
		authenticate_admin!
		if Semester.all.count == 1
			flash[:alert] = "You can't delete the last semester!"
			redirect_back(fallback_location: root_path)
			return
		end
		semester = Semester.find(params[:id])
		if semester.active
			flash[:alert] = "You can't delete the active semester!"
			redirect_back(fallback_location: root_path)
			return
		end
		semester.destroy
		flash[:alert] = "Semester Succesfully deleted"
		redirect_to '/'
	end

	def json
		 render json: Assignment.last
	end
	private
	def semester_params
		params.require(:semester).permit(:title, :enrollment_code)
	end
end
