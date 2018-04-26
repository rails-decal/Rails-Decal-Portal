class AddAttendanceWordToWeek < ActiveRecord::Migration[5.1]
  def change
  	add_column :weeks, :attendance_word, :string
  end
end
