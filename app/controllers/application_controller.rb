class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate!
    @current_user = get_current_user
    if @current_user.nil?
      puts "User is nil"
      redirect_to "/sign_in"
    elsif @current_user.is_a? Admin
      :authenticate_admin!
      puts "User is admin"
    elsif @current_user.is_a? Student
      :authenticate_student!
      puts "User is student"
    else
      puts "What the hell is user??"
      puts @current_user
      redirect_to "/sign_in"
    end
    is_admin
  end

  def user_signed_in
    !get_current_user.nil?
  end

  def get_current_user
    current_student || current_admin
  end

  def is_admin
    @current_user = get_current_user
    if @current_user and @current_user.is_a? Admin
      puts "Is admin!"
      true
    else
      puts "Is not admin :("
      false
    end
  end

  helper_method :user_signed_in
  helper_method :is_admin
  helper_method :get_current_user

end
