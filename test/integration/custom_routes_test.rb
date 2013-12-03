require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest

	 test "that the /login route opens the login page" do
	 	get '/login'
	 	assert_response :success
	end

	 test "that the /register route opens the register page" do
	 	get '/register'
	 	assert_response :success
	end

	 test "that the /reviews route opens the reviews page" do
	 	get '/reviews'
	 	assert_response :success
	end

	 test "that the /newreview route opens the new review page" do
	 	get '/newreview'
	 	assert_response :redirect
	end

	test "that a profile page works" do
		get '/jcuna'
		assert_response :success
	end
end
