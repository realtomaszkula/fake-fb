class Post < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :parent, :class_name => 'Profile'
  has_many :comments, foreign_key: 'parent_id'
  has_many :likes, :as => :likable

  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: /\Aimage/
  validates_attachment_file_name :photo, matches: [/png\Z/, /jpe?g\Z/]
  validates_attachment_size :photo , less_than: 1.megabytes

end
