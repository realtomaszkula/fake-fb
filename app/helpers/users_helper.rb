module UsersHelper

  def like_or_dislike(post, id)
    post.likes.pluck(:author_id).include?(id) ? 'delete' : 'post'
  end

end
