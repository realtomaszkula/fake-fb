class PostsController < ApplicationController
  after_action :create_nofitication, only: [:create]

  def index
    friends = current_user.accepted_friendships(false).collect do |f|
        f.user.posts.take(3)
      end.flatten

     @posts = friends.sort_by(&:created_at).reverse.take(10)
     @post = Post.new
     @like = Like.new
     @comment = Comment.new
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
    @comment = Comment.new
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

  private

  def post_params
    params.require(:post).permit(:author_id, :parent_id, :content, :photo)
  end

  def create_nofitication
    giver_id     = current_user.id
    receiver_id  = params[:post][:parent_id]
    return if giver_id == receiver_id.to_i
    model     = @post
    super(giver_id, receiver_id, model)
  end
end
