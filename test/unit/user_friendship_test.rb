require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
	should belong_to(:user)
	should belong_to(:friend)

	test "that creating a friendship works without reasing an exception" do
		assert_nothing_raised do
		UserFrienship.create user: users(:Jon), friend: users(:Jero)
	end
	end
end
