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
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :semester, optional: true
  validates :name, presence: true
  has_many :attendances
  has_many :student_submissions
  has_many :submissions, :through => :student_submissions

  after_create -> { add_semester(Student.last) }

  private

  def add_semester(student)
  	student.semester_id = Semester.where(active: true).sort_by {|s| s.created_at}.last.id
  	student.save!
  end
end
