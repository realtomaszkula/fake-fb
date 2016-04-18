class Comment < ActiveRecord::Base
  default_scope { order('created_at ASC') }

  belongs_to :author, :class_name => 'User'
  belongs_to :parent, :class_name => 'Post'
  has_many :likes, :as => :likable

end
