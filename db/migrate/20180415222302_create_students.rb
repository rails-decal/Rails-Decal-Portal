class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email, null: false, default: ""
      t.string :picture
      t.references :semester, foreign_key: true
      t.timestamps
    end
  end
end
