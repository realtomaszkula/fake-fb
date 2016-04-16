class LikesController < ApplicationController
  def create
    @like = Like.create(like_params)
    redirect_to :back
  end

  def destroy
    Like.where(author_id: params[:like][:author_id], parent_id: params[:like][:parent_id]).first.destroy
    redirect_to :back
  end

  private

  def like_params
    params.require(:like).permit(:parent_id, :author_id)
  end
end
