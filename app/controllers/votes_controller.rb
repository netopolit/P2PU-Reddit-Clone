class VotesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def create
    @link = Link.find(params[:vote][:link_id])
    current_user.votes.create(:link_id => @link.id)
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
  
end