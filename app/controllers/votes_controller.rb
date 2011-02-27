class VotesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def create
    @link = Link.find(params[:vote][:link_id])

    unless voted?(@link)
      @points = params[:vote][:points].to_i
      current_user.votes.create(:link_id => @link.id, :points => @points)
      change_link_score(@link, @points)
      if @points == 1
        @score_color = 'green'
        @selector1 = 'first'
        @element1 = '<div class="arrow upvoted"></div>'
        @selector2 = 'last'
        @element2 = '<div class="noarrow"></div>'
      else
        @score_color = 'red'
        @selector1 = 'last'
        @element1 = '<div class="arrow downvoted"></div>'
        @selector2 = 'first'
        @element2 = '<div class="noarrow"></div>'
      end
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

  
  def change_link_score(link, points)
    score = link.score + points
    link.update_attributes(:score => score)
  end

end