class RemoveStudentIdFromSubmission < ActiveRecord::Migration[5.1]
  def change
    remove_column :submissions, :student_id
  end
end
