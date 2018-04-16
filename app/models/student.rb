# == Schema Information
#
# Table name: students
#
#  id          :integer          not null, primary key
#  name        :string
#  email       :string
#  picture     :string
#  semester_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Student < ApplicationRecord
  belongs_to :semester
  has_many :attendances
  has_many :student_submissions
  has_many :submissions, :through => :student_submissions
end
