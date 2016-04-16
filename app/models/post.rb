class Post < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :parent, :class_name => 'Profile'
  has_many :comments, foreign_key: 'parent_id'
  has_many :likes, foreign_key: 'parent_id'
end
