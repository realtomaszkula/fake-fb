class Comment < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :parent, :class_name => 'Post'
end
