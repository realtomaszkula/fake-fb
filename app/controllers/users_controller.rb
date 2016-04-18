class UsersController < ApplicationController
  before_action :find_user, only: [:show, :friends]
  layout 'profile'

  def index
    @users = User.all
    render layout: 'application'
  end

  def show
    @post = Post.new
    @comment = Comment.new
    @like = Like.new

    @friends_in_3s = @user.accepted_friendships(false).take(9).in_groups_of(3)
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    @user.save

    redirect_to :back
  end

  def friends
    @friends_in_2s = @user.accepted_friendships(false).in_groups_of(2)
  end


  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:avatar_url)
  end
end
