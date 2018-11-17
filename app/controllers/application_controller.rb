class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  before_action :set_semester
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :user_signed_in
  helper_method :is_admin

  def authenticate!
    if @current_user.nil?
      redirect_to "/sign_in"
    elsif @current_user.is_a? Admin
      :authenticate_admin!
    elsif @current_user.is_a? Student
      :authenticate_student!
    else
      redirect_to "/sign_in"
    end
    is_admin
  end

  def user_signed_in
    !@current_user.nil?
  end

  # Creates variable for all controllers to access current_user
  def set_current_user
    @current_user = current_student || current_admin
  end

  def is_admin
    if @current_user and @current_user.is_a? Admin
      true
    else
      false
    end
  end

  # Creates variable for all controllers to access current_user
  def set_semester
    id = params[:semester_id]
    if id
      @semester = Semester.find(id)
    else
      @semester = Semester.all.sort_by {|x| [x.active ? 1 : 0, x.created_at] }.last
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :enrollment_code])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :picture, :office_hours, :active])
  end

end
