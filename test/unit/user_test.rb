require 'test_helper'

class UserTest < ActiveSupport::TestCase

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
end
