module UsersHelper

  def like_or_dislike(post, id)
    post.likes.pluck(:author_id).include?(id) ? 'delete' : 'post'
  end

  def like_or_dislike_class(post, id)
    post.likes.pluck(:author_id).include?(id) ? 'default' : 'primary'
  end

end
