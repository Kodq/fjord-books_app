# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
    redirect_to user
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
    redirect_to user
  end

  def follower
    @user = User.find(params[:user_id])
    @followings = user.followings
  end

  def followed
    @user = User.find(params[:user_id])
    @followers = user.followers
  end
end
