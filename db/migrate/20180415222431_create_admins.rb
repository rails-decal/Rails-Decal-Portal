class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.boolean :active
      t.string :email
      t.string :name
      t.string :office_hours
      t.string :picture

      t.timestamps
    end
  end
end
