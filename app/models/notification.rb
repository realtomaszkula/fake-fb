class Notification < ActiveRecord::Base
  default_scope { order('created_at DESC') }


  belongs_to :notifiable, polymorphic: true
  belongs_to :receiver, class_name: 'User'
  belongs_to :giver, class_name: 'User'

end
