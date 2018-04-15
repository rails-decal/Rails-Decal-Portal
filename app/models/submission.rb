class Submission < ApplicationRecord
  belongs_to :assignment
  belongs_to :admin
  has_many :student_submissions
  has_many :students, :through => :student_submissions
end
