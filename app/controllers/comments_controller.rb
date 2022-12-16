class CommentsController < ApplicationController

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to request.referer
    end
  end

    def  destroy
    end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end