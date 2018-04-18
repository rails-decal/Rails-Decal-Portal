# == Schema Information
#
# Table name: submissions
#
#  id            :integer          not null, primary key
#  link			 :text
#  score         :integer
#  date          :datetime
#  graded        :boolean
#  comment       :text
#  assignment_id :integer
#  admin_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Submission < ApplicationRecord
  belongs_to :assignment
  belongs_to :admin
  has_many :student_submissions
  has_many :students, :through => :student_submissions

  validates :link, :date, presence: true
end
