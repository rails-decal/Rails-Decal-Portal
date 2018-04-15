class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.integer :type
      t.text :comment
      t.references :week, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
