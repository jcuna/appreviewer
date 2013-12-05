require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:friend)

  test "that creating a friendship works" do
    assert_nothing_raised do
      UserFriendship.create user: users(:jason), friend: users(:mike)
    end
  end

  context "after successful creation" do
    setup do
      @user_friendship = UserFriendship.create user: users(:jason), friend: users(:mike)
    end

    should "have a pending state" do
      assert_equal 'pending', @user_friendship.state
    end
  end

  context "#send_request_email" do
    setup do
      @user_friendship = UserFriendship.create user: users(:jason), friend: users(:mike)
    end

    should "fire an email" do
      assert_difference 'ActionMailer::Base.deliveries.size' do
        @user_friendship.send_request_email
      end
    end
  end

  context "#accept!" do
    setup do
      @user_friendship = UserFriendship.request users(:jason), users(:mike)
    end

    should "send an acceptance email" do
      assert_difference 'ActionMailer::Base.deliveries.size', 1 do
        @user_friendship.accept!
      end
    end

    should "set the state to accepted" do
      @user_friendship.accept!
      assert_equal "accepted", @user_friendship.state
    end

    should "include the friend in the list of users" do
      @user_friendship.accept!
      users(:jason).friends.reload
      assert users(:jason).friends.include?(users(:mike))
    end
  end

  context '#block!' do
    setup do
      @user_friendship = UserFriendship.request users(:jason), users(:Jero)
    end

    should "set the state to blocked" do
      @user_friendship.block!
      assert_equal 'blocked', @user_friendship.state
      assert_equal 'blocked', @user_friendship.mutual_friendship.state
    end

    should "not allow new requests once blocked" do
      @user_friendship.block!
      uf = UserFriendship.request users(:jason), users(:Jero)
      assert !uf.save
    end
  end
end
