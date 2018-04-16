# == Schema Information
#
# Table name: semesters
#
#  id         :integer          not null, primary key
#  title      :string
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Semester < ApplicationRecord
  has_many :weeks
  has_many :students
end
