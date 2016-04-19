class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!


  def create_nofitication(giver_id, receiver_id, model)
      model.notifications.create(receiver_id: receiver_id, giver_id: giver_id)
  end

end
