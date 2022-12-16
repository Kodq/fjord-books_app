# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    redirect_to request.referer if @comment.save
  end

  def destroy; end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
