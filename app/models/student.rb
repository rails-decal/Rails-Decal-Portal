# == Schema Information
#
# Table name: students
#
#  id          :integer          not null, primary key
#  name        :string
#  email       :string
#  picture     :string
#  semester_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :rememberable, :trackable, :validatable
  belongs_to :semester, optional: true
  validates :name, presence: true
  validate :valid_enrollment, :on => :create
  has_many :attendances
  has_many :student_submissions
  has_many :submissions, :through => :student_submissions

  def valid_enrollment
    sorted = Semester.all.sort_by {|x| [x.active ? 1 : 0, x.created_at] }
    if sorted.count == 0
      errors.add(:base, "There are no available semesters")
    else
      if enrollment_code != sorted.last.enrollment_code
        errors.add(:base, "#{enrollment_code} is not a valid enrollment code")
      end
    end
  end

  after_create -> { add_semester(Student.last) }

  private

  def add_semester(student)
  	student.semester_id = Semester.all.sort_by {|x| [x.active ? 1 : 0, x.created_at] }.last.id
  	student.save!
  end
end
