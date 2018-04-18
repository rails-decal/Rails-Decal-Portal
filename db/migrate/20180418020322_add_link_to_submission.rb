class AddLinkToSubmission < ActiveRecord::Migration[5.1]
  def change
  	add_column :submissions, :link, :string 
  end
end
