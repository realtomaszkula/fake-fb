class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post created!'
    else
      flash[:warning] = 'Error!'
    end
      redirect_to :back
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:author_id, :parent_id, :content)
  end

end
