# == Schema Information
#
# Table name: weeks
#
#  id          :integer          not null, primary key
#  date        :date
#  title       :string
#  description :text
#  week_number :integer
#  attendance_word :string
#  semester_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Week < ApplicationRecord
  belongs_to :semester
  has_many :resources, :dependent => :restrict_with_error
  has_many :attendances, :dependent => :restrict_with_error
  has_many :assignments, :dependent => :restrict_with_error

  validates :date, :title, :week_number, presence: true
end
