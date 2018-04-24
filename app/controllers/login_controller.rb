class LoginController < ApplicationController
  before_action :check_authentication!, except: [:sign_out]

  def check_authentication!
    if user_signed_in
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

  def choose
  end
end
