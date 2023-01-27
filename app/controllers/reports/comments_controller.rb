# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  before_action :set_commentable

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to report_url(@commentable)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end
end
