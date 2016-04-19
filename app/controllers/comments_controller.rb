class CommentsController < ApplicationController
  after_action :create_nofitication, only: [:create]

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

  def create_nofitication
    giver_id     = current_user.id
    receiver_id  = @comment.parent.author.id
    return if giver_id == receiver_id.to_i

    model     = @comment
    super(giver_id, receiver_id, model)
  end

end
