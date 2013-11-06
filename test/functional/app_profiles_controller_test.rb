require 'test_helper'

class AppProfilesControllerTest < ActionController::TestCase
  setup do
    @app_profile = app_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:app_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create app_profile" do
    assert_difference('AppProfile.count') do
      post :create, app_profile: { name: @app_profile.name }
    end

    assert_redirected_to app_profile_path(assigns(:app_profile))
  end

  test "should show app_profile" do
    get :show, id: @app_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @app_profile
    assert_response :success
  end

  test "should update app_profile" do
    put :update, id: @app_profile, app_profile: { name: @app_profile.name }
    assert_redirected_to app_profile_path(assigns(:app_profile))
  end

  test "should destroy app_profile" do
    assert_difference('AppProfile.count', -1) do
      delete :destroy, id: @app_profile
    end

    assert_redirected_to app_profiles_path
  end
end
