module UsersHelper

  def already_liked?(likable, user_id)
    likable.likes.exists?(:author_id => user_id)
  end

  def find_like(likable, user_id)
    likable.likes.find_by(:author_id => user_id)
  end

  def notification_msg(n)
    str = "#{n.giver.name} "
    str <<  case n.notifiable_type
            when "Post"
              "posted on your wall"
            when "Comment"
              "commented on your post"
            when "Like"
              "liked your #{n.notifiable.likable.class == Post ? "post" : "comment"}"
            end
  end

  def notification_post_id(n)
    case n.notifiable_type
    when "Post"
      n.notifiable
    when "Comment"
      n.notifiable.parent
    when "Like"
      n.notifiable.likable.class == Post ? n.notifiable.likable : n.notifiable.likable.parent
    end
  end
end
