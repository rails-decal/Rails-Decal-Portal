class Student < ApplicationRecord
  belongs_to :semester
  has_many :attendances
  has_many :student_submissions
  has_many :submissions, :through => :student_submissions
end
