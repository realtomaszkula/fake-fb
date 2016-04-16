class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @like = Like.new
    @comment = Comment.new

    @friends = @user.accepted_friendships(false).take(9).in_groups_of(3)

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    @user.save

    redirect_to :back

  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:avatar_url)
  end
end
