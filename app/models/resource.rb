# == Schema Information
#
# Table name: resources
#
#  id          :integer          not null, primary key
#  link        :string
#  title       :string
#  description :text
#  week_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Resource < ApplicationRecord
  belongs_to :week
  
  validates :link, :title, presence: true
end
