class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :title
      t.datetime :due_date
      t.text :description
      t.string :link
      t.references :week, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
