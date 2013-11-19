require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
	should belong_to(:user)
	should belong_to(:friend)

	test "that creating a friendship works without reasing an exception" do
		assert_nothing_raised do
		UserFriendship.create user: users(:Jon), friend: users(:Jero)
	end
end
	test "that creating a friendship based on user id and friend id works" do
		UserFriendship.create user_id: users(:Jon).id, friend_id: users(:Jero).id
		assert users(:Jon).friends.include?(users(:Jero))
	end

	context "a new instance" do
		setup do
			@user_friendship = UserFriendship.new user: users(:Jero), friend: users(:Jon)
		end

		should "have a pending state" do
			assert_equal 'pending', @user_friendship.state
		end
	end

	context "#send_request_email" do
		setup do
			@user_friendship = UserFriendship.create user: users(:Jero), friend: users(:Jon)
		end

		should "send an email" do
			assert_difference 'ActionMailer::Base.deliveries.size', 1 do
				@user_friendship.send_request_email
			end
		end
	end
end
