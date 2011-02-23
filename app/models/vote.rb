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

  validates_uniqueness_of :link_id, :scope => :user_id
  
end
