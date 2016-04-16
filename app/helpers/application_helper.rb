module ApplicationHelper

  def avatar_url(user, s = "")
    if user.avatar_url.present?
      user.avatar_url
    else
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{s}"
    end
  end


  def common_friends(user, current_user)
    user.accepted_friendships & current_user.accepted_friendships
  end

end
