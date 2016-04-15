class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :friendships
  has_many :friends, :through => :friendships
  # has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => 'friend_id'
  # has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'


  def current_friends_ids
    friends.pluck(:id)
  end

  def sent_friend_requests
    (Friendship.where(user_id: id).pluck(:friend_id) - accepted_friendships)
  end

  def received_friend_requests(id_only = true)
    f = Friendship.where(friend_id: id).where.not(user_id: current_friends_ids)
    id_only ? f.pluck(:user_id) : f
  end

  def accepted_friendships(id_only = true)
    f = Friendship.where(friend_id: id).where(user_id: current_friends_ids)
    id_only ?  f.pluck(:user_id) : f
  end


end

