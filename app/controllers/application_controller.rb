class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :voted?, :voted_up?

  def voted?(link)
    !current_user.votes.where(:link_id => link.id).empty?
  end

  def voted_up?(link)
    vote = current_user.votes.where(:link_id => link.id).first
    vote.points == 1
  end
  
end
