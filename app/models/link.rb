# == Schema Information
# Schema version: 20110223162600
#
# Table name: links
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  title       :string(255)
#  url         :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Link < ActiveRecord::Base
  belongs_to :user

  attr_accessible :title, :url, :description
end
