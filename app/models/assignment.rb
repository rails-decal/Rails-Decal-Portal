# == Schema Information
#
# Table name: assignments
#
#  id          :integer          not null, primary key
#  title       :string
#  due_date    :datetime
#  description :text
#  link        :string
#  week_id     :integer
#  points      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Assignment < ApplicationRecord
  belongs_to :week
  has_many :submissions, :dependent => :restrict_with_error
  attr_accessor :week_number
  delegate :semester, :to => :week
  validates :title, :due_date, :link, :points, presence: true
end
