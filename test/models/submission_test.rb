# == Schema Information
#
# Table name: submissions
#
#  id            :integer          not null, primary key
#  score         :integer
#  date          :datetime
#  graded        :boolean
#  comment       :text
#  assignment_id :integer
#  admin_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
