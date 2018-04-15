class Week < ApplicationRecord
  belongs_to :semester
  has_many :resources
  has_many :attendances
  has_many :assignments
end
