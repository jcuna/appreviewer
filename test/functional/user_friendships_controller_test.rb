require 'test_helper'

class UserFriendshipsControllerTest < ActionController::TestCase
		context "#new" do
			context "when not logged in" do
				should "redirect to the login page" do
					get :new
					assert_response :redirect
				end
			end
			context "when logged in" do
				setup do 
					sign_in users(:Jero)
				end
				should "get new and return success" do
					get :new
					assert_response :success
				end

			should "set a fash error if the friend_id params is missing" do
			get :new, {}
			assert_equal "Friend required", flash[:error]

			end

			should "display the friend's name" do
				get :new, friend_id: users(:Jon).id
				assert_match /#{users(:Jon).full_name}/, response.body
			end

			should "assign a new user friendship" do
				get :new, friend_id: users(:Jon).id
				assert assigns(:user_friendship)
			end

			should "assign a new user friendship to the correct friend" do
				get :new, friend_id: users(:Jon).id
				assert_equal users(:Jon), assigns(:user_friendship).friend
			end

			should "assign a new user friendship to the currently logged in user" do
				get :new, friend_id: users(:Jon).id
				assert_equal users(:Jero), assigns(:user_friendship).user
			end

			should "return a 404 status if no friend is found" do
				get :new, friend_id: 'invalid'
				assert_response :not_found
			end
		end
	end
end
