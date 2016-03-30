class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => 'friend_id'
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user


  def current_friends_ids
    friends.pluck(:id)
  end

  def sent_friend_requests
    Friendship.where(user_id: current_friends_ids).where.not(friend_id: id)
  end

  def received_friend_requests
    Friendship.where(friend_id: id).where.not(user_id: current_friends_ids)
  end

  def accepted_friendships
    Friendship.where(friend_id: id).where(user_id: current_friends_ids)
  end


end

