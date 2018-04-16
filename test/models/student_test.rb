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

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
