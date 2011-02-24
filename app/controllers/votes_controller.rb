class VotesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def create
    @link = Link.find(params[:vote][:link_id])

    if current_user.votes.where(:link_id => @link.id).empty?
      @points = params[:vote][:points]
      current_user.votes.create(:link_id => @link.id, :points => @points)
      change_link_score(@link)
    end

    respond_to do |format|
      format.html { redirect_to @link }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def change_link_score(link)
    score = link.score + 1
    link.update_attributes(:score => score)
  end

end