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

require 'test_helper'

class StudentSubmissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
