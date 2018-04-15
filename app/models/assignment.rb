class Assignment < ApplicationRecord
  belongs_to :week
  has_many :submissions
end
