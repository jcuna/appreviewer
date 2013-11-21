require 'test_helper'

class UserTest < ActiveSupport::TestCase


      should have_many (:user_friendships)
      should have_many (:friends)

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
      user.profile_name = users(:Jon).profile_name

      users(:Jon)

      assert !user.save
      assert !user.errors[:profile_name].empty?
    end

      test "a user should have a profile name without spaces" do
      user = User.new(first_name: 'Jon', last_name: 'Cuna', email: 'cunas@me.com')
      user.password = user.password_confirmation = "asasas"

      assert !user.save
      assert !user.errors[:profile_name].empty?
      assert user.errors[:profile_name].include?("May not contain spaces or special characters.")
    end

      test "a user can have a correctly formatted profile name" do
      user = User.new(first_name: 'Jon', last_name: 'Cuna', email: 'cunas@me.com')
      user.password = user.password_confirmation = 'asasas'

      user.profile_name = 'jcuna_1'
      assert !user.valid?
    end


    test "that no error is raised when trying to access a friend list" do
      assert_nothing_raised do
      users(:Jon).friends
    end
  end

    test "that creating friendships on a user works" do
      users(:Jon).pending_friends << users(:Jero)
      users(:Jon).pending_friends.reload
      assert users(:Jon).pending_friends.include?(users(:Jero))
    end

    test "that calling to_param on a user returns profile_name" do
      assert_equal "jcuna", users(:Jon).to_param
    end

end
