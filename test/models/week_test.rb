# == Schema Information
#
# Table name: weeks
#
#  id          :integer          not null, primary key
#  date        :date
#  title       :string
#  description :text
#  semester_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class WeekTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
