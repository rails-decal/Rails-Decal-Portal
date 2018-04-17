class AddWeeknumberToWeeks < ActiveRecord::Migration[5.1]
  def change
  	add_column :weeks, :week_number, :integer
  end
end
