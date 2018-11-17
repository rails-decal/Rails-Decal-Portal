# == Schema Information
#
# Table name: semesters
#
#  id         :integer          not null, primary key
#  title      :string
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Semester < ApplicationRecord
  has_many :weeks, :dependent => :restrict_with_error
  has_many :students, :dependent => :restrict_with_error

  def self.latest
    self.sorted.last
  end

  def self.sorted
    self.all.sort_by {|x| [x.active ? 1 : 0, x.created_at] }
  end
end
