class ChangeStudentEnrollmentCodeToString < ActiveRecord::Migration[5.1]
  def change
    change_column :students, :enrollment_code, :string
    change_column :semesters, :enrollment_code, :string
  end
end
