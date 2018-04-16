# == Schema Information
#
# Table name: attendances
#
#  id         :integer          not null, primary key
#  status     :integer
#  comment    :text
#  week_id    :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Attendance < ApplicationRecord
  belongs_to :week
  belongs_to :student
  enum status: [:absent, :present, :requested, :excused]
end
