class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :link
      t.string :title
      t.text :description
      t.references :week, foreign_key: true

      t.timestamps
    end
  end
end
