class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.integer :score
      t.datetime :date
      t.boolean :graded
      t.text :comment
      t.references :assignment, foreign_key: true
      t.references :admin, foreign_key: true
      t.timestamps
    end
  end
end
