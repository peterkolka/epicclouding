require 'test_helper'

class UserSharesControllerTest < ActionController::TestCase
  setup do
    @user_share = user_shares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_shares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_share" do
    assert_difference('UserShare.count') do
      post :create, user_share: { approved_at: @user_share.approved_at, share_id: @user_share.share_id, user_id: @user_share.user_id }
    end

    assert_redirected_to user_share_path(assigns(:user_share))
  end

  test "should show user_share" do
    get :show, id: @user_share
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_share
    assert_response :success
  end

  test "should update user_share" do
    put :update, id: @user_share, user_share: { approved_at: @user_share.approved_at, share_id: @user_share.share_id, user_id: @user_share.user_id }
    assert_redirected_to user_share_path(assigns(:user_share))
  end

  test "should destroy user_share" do
    assert_difference('UserShare.count', -1) do
      delete :destroy, id: @user_share
    end

    assert_redirected_to user_shares_path
  end
end
