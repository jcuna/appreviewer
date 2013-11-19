class UserNotifier < ActionMailer::Base
  default from: "AppReviewer@cuna.com"

def follow_requested(user_friendship_id)
	user_friendship = UserFriendship.find(user_friendship_id)

	@user = user_friendship.user
	@friend = user_friendship.friend

	mail to: @friend.email,
		subject: "#{@user.first_name} wants to follow your reviews"
	end

def follow_request_accepted(user_friendship_id)
	user_friendship = UserFriendship.find(user_friendship_id)

	@user = user_friendship.user
	@friend = user_friendship.friend

	mail to: @user.email,
		subject: "You are now following #{@friend.first_name}'s reviews"
	end 
end
