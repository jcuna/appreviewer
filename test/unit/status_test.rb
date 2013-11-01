require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test "That a status requires content" do
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?  	
  end


test "Review content is at least two letters long" do
	status = Status.new
	status.content = "H"
	assert !status.save
	assert !status.errors[:content].empty?
end

	test "that a review has a user id" do
		status = Status.new
		status.content = "Hello"
		assert !status.save
		assert !status.errors[:user_id].empty?
end
end