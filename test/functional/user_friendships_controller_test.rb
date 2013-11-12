require 'test_helper'

class UserFriendshipsControllerTest < ActionController::TestCase
  context "#new" do
    context "when not logged in" do
      should "redirect to the login page" do
        get :new
        assert_response :redirect
        assert_redirected_to login_path
      end
    end

    context "when logged in" do
      setup do
        sign_in users(:Jon)
      end

      should "get new without error" do
        get :new
        assert_response :success
      end

      should "should set a flash error if the friend_id param is missing" do
        get :new, {}
        assert_equal "Friend required", flash[:error]
      end

      should "display a 404 page if no friend is found" do
        get :new, friend_id: 'invalid'
        assert_response :not_found
      end

      should "display the friend's name" do
        get :new, friend_id: users(:Jero)
        assert_match /#{users(:Jero).full_name}/, response.body
      end

      should "assign a user friendship" do
        get :new, friend_id: users(:Jero)
        assert assigns(:user_friendship)
      end

      should "assign a user friendship with the user as current user" do
        get :new, friend_id: users(:Jero)
        assert_equal assigns(:user_friendship).user, users(:Jon)
      end

      should "assign a user friendship with the correct friend" do
        get :new, friend_id: users(:Jero)
        assert_equal assigns(:user_friendship).friend, users(:Jero)
      end
    

    should "ask if you really want to friend the user" do
    get :new, friend_id: users(:Jero)
    assert_match /Do you really want to friend #{users(:Jero).full_name}?/, response.body
  end
end
end

  
#  context "#create" do
#    context "when not logged in" do
#      should "redirect to the login page" do
#        get :new
#        assert_response :redirect
#        assert_redirected_to login_path
#      end
#    end
#
#   context "when logged in" do
#     setup do
#        sign_in users(:Jon)
#      end
#
#      context "with no friend_id" do
#        setup do
#          post :create
#        end
#
#        should "set the flash error message" do
#          assert !flash[:error].empty?
#        end
#
#        should "set redirect to root" do
#          assert_redirected_to root_path
#        end
#      end

#      context "with a valid friend_id" do
#        setup do
#          post :create, friend_id: users(:Jero).id
#        end

        #should "assign a friend object" do
#          assert_equal users(:Jero), assigns(:friend)
#        end

#        should "assign a user_friendship object" do
#          assert assigns(:user_friendship)
#          assert_equal users(:Jon), assigns(:user_friendship).user
#          assert_equal users(:Jero), assigns(:user_friendship).friend
#        end

#        should "create a user friendship" do
#          assert users(:Jon).friends.include?(users(:Jero))
#        end
#      end


 #   end
 # end
end