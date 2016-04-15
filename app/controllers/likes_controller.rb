class LikesController < ApplicationController
  def create
    @like = Like.create(like_params)
    redirect_to :back
  end

  def destroy
  end

  private

  def like_params
    params.require(:like).permit(:parent_id, :author_id)
  end
end
