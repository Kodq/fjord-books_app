# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  # follower一覧
  def follower
    @user = User.find(params[:user_id])
    @following = user.followings
  end

  # followed一覧
  def followed
    @user = User.find(params[:user_id])
    @follower = user.followers
  end
end
