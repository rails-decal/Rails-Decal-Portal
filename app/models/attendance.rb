class Attendance < ApplicationRecord
  belongs_to :week
  belongs_to :student
  enum status: [:absent, :present, :requested, :excused]
end
