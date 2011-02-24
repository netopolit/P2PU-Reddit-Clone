class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :voted?

  def voted?(link)
    !current_user.votes.where(:link_id => link.id).empty?
  end
  
end
