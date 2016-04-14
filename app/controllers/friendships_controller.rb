class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])

    if @friendship.save
      flash[:notice] = "Friend request sent"
      redirect_to :back
    else
      flash[:notice] = "Unable to add friend"
      redirect_to :back
    end
  end

  def destroy
    if params.has_key?(:decline_only)
      user = User.find(params[:id])
      @inverse_friendship = user.friendships.find_by(friend_id: current_user.id)
      @inverse_friendship.destroy
    else
      @friendship = current_user.friendships.find_by(friend_id: params[:id])
      @friendship.destroy
    end

    redirect_to :back
  end



end
