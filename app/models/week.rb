# == Schema Information
#
# Table name: weeks
#
#  id          :integer          not null, primary key
#  date        :date
#  title       :string
#  description :text
#  week_number :integer
#  semester_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Week < ApplicationRecord
  belongs_to :semester
  has_many :resources
  has_many :attendances
  has_many :assignments

  validates :date, :title, :week_number, presence: true
end
