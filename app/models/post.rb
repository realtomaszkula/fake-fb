class Post < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  has_many :comments, foreign_key: 'parent_id'
  has_many :likes
end
