class AddEnrollmentCodeToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :enrollment_code, :integer
  end
end
