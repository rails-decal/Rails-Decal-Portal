class CreateWeeks < ActiveRecord::Migration[5.1]
  def change
    create_table :weeks do |t|
      t.date :date
      t.string :title
      t.text :description
      t.references :semester, foreign_key: true

      t.timestamps
    end
  end
end
