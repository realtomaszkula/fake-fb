class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => 'friend_id'
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :posts
  has_many :comments
  has_many :likes



  def current_friends_ids
    friends.pluck(:id)
  end

  def sent_friend_requests
    (Friendship.where(user_id: id).pluck(:friend_id) - accepted_friendships)
  end

  def received_friend_requests
    Friendship.where(friend_id: id).where.not(user_id: current_friends_ids).pluck(:user_id)
  end

  def accepted_friendships
    Friendship.where(friend_id: id).where(user_id: current_friends_ids).pluck(:user_id)
  end


end

