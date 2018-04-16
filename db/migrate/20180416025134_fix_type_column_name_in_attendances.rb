class FixTypeColumnNameInAttendances < ActiveRecord::Migration[5.1]
  def change
  	rename_column :attendances, :type, :status
  end
end
