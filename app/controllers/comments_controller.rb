class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to :back
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id, :author_id)
  end

end
