class Like < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :likable, :polymorphic => true
  has_many :notifications, as: :notifiable
end
