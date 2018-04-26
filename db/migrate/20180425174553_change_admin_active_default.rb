class ChangeAdminActiveDefault < ActiveRecord::Migration[5.1]
  def change
  	change_column_default :admins, :active, true
  end
end
