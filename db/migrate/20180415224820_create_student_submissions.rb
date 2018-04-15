class CreateStudentSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :student_submissions do |t|
      t.references :student, foreign_key: true
      t.references :submission, foreign_key: true
      t.timestamps
    end
  end
end
