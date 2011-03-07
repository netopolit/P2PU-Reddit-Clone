# == Schema Information
# Schema version: 20110224132258
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
#  score       :integer         default(0)
#

class Link < ActiveRecord::Base
  belongs_to :user
  has_many :votes, :dependent => :destroy

  validates :user_id, :presence => true
  validates :title, :presence => true
  validates :url, :presence => true
  validates_url_format_of :url,
                          :allow_nil => true,
                          :message => "doesn't seem to be valid"

  default_scope order('score DESC, created_at DESC')

  attr_accessible :title, :url, :description


end
