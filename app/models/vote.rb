# == Schema Information
# Schema version: 20110223193738
#
# Table name: votes
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  link_id    :integer
#  points     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  validates :user_id, :presence => true
  validates :link_id, :presence => true
  validates_inclusion_of :points, :in => [-1, 0, 1],
    :message => "%{value} is not a valid score"
  #Should ensure max one vote by specific user per article?
  validates_uniqueness_of :link_id, :scope => :user_id

  attr_accessible :title, :url, :description

end