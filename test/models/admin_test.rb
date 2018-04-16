# == Schema Information
#
# Table name: admins
#
#  id           :integer          not null, primary key
#  active       :boolean
#  email        :string
#  name         :string
#  office_hours :string
#  picture      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
