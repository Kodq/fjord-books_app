class UsersController < ApplicationController
  def index
    @user = User.order(:id).page(params[:page]).per(2)
  end

  def show
    @user = User.find(params[:id])
  end
end
