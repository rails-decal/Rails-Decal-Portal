class Semester < ApplicationRecord
  has_many :weeks
  has_many :students
end
