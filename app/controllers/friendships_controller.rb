class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])

    if @friendship.save
      flash[:notice] = "Friend request sent"
      redirect_to root_url
    else
      redirect_to root_url
      flash[:notice] = "Unable to add friend"
    end
  end

  def destroy
  end

end
