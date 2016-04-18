module UsersHelper

  def already_liked?(likable, user_id)
    likable.likes.exists?(:author_id => user_id)
  end

  def find_like(likable, user_id)
    likable.likes.find_by(:author_id => user_id)
  end

end
