class LoginController < ApplicationController

  def check_authentication!
    if user_signed_in
      flash[:error] = "You are already signed in"
      redirect_to '/'
    end
  end

  def sign_out
    if is_admin
      redirect_to destroy_admin_session_path
    else
      redirect_to destroy_student_session_path
    end
  end

  def edit_profile
    if is_admin
      redirect_to edit_admin_registration_path
    else
      redirect_to edit_student_registration_path
    end
  end

  def sign_in
    check_authentication!
  end
end
