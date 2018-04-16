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

class Admin < ApplicationRecord
  has_many :submissions
end
