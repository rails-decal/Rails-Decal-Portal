class Attendance < ApplicationRecord
  belongs_to :week
  belongs_to :student
end
