module ApplicationHelper

  def owner?(user)
    user == current_user
  end

end
