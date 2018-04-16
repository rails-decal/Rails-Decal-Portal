# == Schema Information
#
# Table name: student_submissions
#
#  id            :integer          not null, primary key
#  student_id    :integer
#  submission_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class StudentSubmission < ApplicationRecord
  belongs_to :student
  belongs_to :submission
end
