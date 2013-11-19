class UserFriendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

  attr_accessible :user_id, :friend_id, :user, :friend

  state_machine :state, initial: :pending do
  	
  end

  def send_request_email
  	UserNotifier.follow_requested(id).deliver
  end

end
