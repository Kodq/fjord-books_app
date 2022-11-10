# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_image.order(:id).page(params[:page])
  end

  def show
    @user = User.with_attached_image.find(params[:id])
  end
end
