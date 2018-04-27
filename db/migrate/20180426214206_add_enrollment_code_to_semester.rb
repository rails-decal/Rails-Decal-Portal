class AddEnrollmentCodeToSemester < ActiveRecord::Migration[5.1]
  def change
    add_column :semesters, :enrollment_code, :integer
  end
end
