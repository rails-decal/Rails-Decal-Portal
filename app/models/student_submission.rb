class StudentSubmission < ApplicationRecord
  belongs_to :student
  belongs_to :submission
end
