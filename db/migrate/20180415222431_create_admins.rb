class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.boolean :active
      t.string :email, null: false, default: ""
      t.string :name
      t.string :office_hours
      t.string :picture

      t.timestamps
    end
  end
end
