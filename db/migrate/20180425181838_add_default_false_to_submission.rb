class AddDefaultFalseToSubmission < ActiveRecord::Migration[5.1]
  def change
  	change_column_default :submissions, :graded, false
  end
end
