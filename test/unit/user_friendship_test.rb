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


end
