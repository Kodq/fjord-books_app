# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[followings followers]

  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @following_users = @user.followings
    @follower_users = @user.followers
  end

  def followings
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
