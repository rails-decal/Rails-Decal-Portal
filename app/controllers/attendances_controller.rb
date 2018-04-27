class AttendancesController < ApplicationController
  before_action :authenticate!

  def index
    @semester = Semester.find(params[:semester_id])
  end

  def create
    if params[:week_id].nil?
      semester = Semester.find(params[:semester_id])
      week = semester.weeks.where(week_number: params[:week_number]).last
      if week.nil?
        flash[:alert] = "Can't create attendance request right now. Try again soon!"
        redirect_back fallback_location: root_path
        return
      end
      attendance = Attendance.create({
        status: 2,
        week_id: week.id,
        student_id: @current_user.id,
        comment: params[:comment]
      })
      attendance.save!

      flash[:notice] = "Absence request submitted"
      redirect_back fallback_location: root_path
    else
      week = Week.find(params[:week_id])
      if params[:attendance_word] == week.attendance_word
        puts "WE MADE IT"
        attendance = Attendance.create({
          status: 1,
          week_id: week.id,
          student_id: @current_user.id
        })
        attendance.save!

        flash[:notice] = "Attendance recorded!"
        redirect_back fallback_location: root_path
      else
        flash[:alert] = "Incorrect attendance word"
        redirect_back fallback_location: root_path
      end
    end
  end

  def update
    attendance = Attendance.find(params[:id])
    attendance.update(status: "excused")
    attendance.save!
    flash[:notice] = "Absence excused"
    redirect_back fallback_location: semester_attendances_path(semester_id: params[:semester_id])
  end
end
