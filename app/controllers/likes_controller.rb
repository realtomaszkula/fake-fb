class LikesController < ApplicationController
  before_action :load_likable

  def create
    @like = @likable.likes.create(like_params)
    redirect_to :back
  end

  def destroy
    @likable.likes.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def load_likable
    resource, id = request.path.split('/')[1,2]   # '/post/1'  =>  ['', post, 1]
    @likable = resource.singularize.classify.constantize.find(id)
  end

  def like_params
    params.require(:like).permit(:author_id)
  end
end
