require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many(:statuses)
  should have_many(:user_friendships)
  should have_many(:friends)
  should have_many(:pending_user_friendships)
  should have_many(:pending_friends)
  should have_many(:requested_user_friendships)
  should have_many(:requested_friends)
  should have_many(:blocked_user_friendships)
  should have_many(:blocked_friends)

  test "a user should enter a first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
    user = User.new
    user.profile_name = users(:jason).profile_name

    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
    user = User.new(first_name: 'Jason', last_name: 'Seifer', email: 'jason2@teamtreehouse.com')
    user.password = user.password_confirmation = 'asdfasdf'

    user.profile_name = 'Contains spaces'

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("May not contain spaces or special characters.")
  end

  test "a user should have a profile name" do
    user = User.new(first_name: 'Jason', last_name: 'Seifer', email: 'jason2@teamtreehouse.com')
    user.password = user.password_confirmation = 'asdfasdf'

    user.profile_name = 'jasonseifer_1'
    assert user.valid?
  end

  context "relationships" do
    context "pending friends" do
      should "include pending friendships" do
        nick = users(:nick)
        jason = users(:jason)

        user_friendship = UserFriendship.request(nick, jason)
        UserFriendship.request(nick, users(:jim))

        assert nick.pending_friends.order('first_name asc').include?(jason)
        assert nick.pending_friends.include?(users(:jim))
        
      end
    end

    context "approved friends" do
    end
  end
end
