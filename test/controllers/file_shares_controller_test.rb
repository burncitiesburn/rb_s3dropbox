require 'test_helper'

class FileSharesControllerTest < ActionController::TestCase
  setup do
    @file_share = file_shares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:file_shares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create file_share" do
    assert_difference('FileShare.count') do
      post :create, file_share: { file_url: @file_share.file_url, user: @file_share.user }
    end

    assert_redirected_to file_share_path(assigns(:file_share))
  end

  test "should show file_share" do
    get :show, id: @file_share
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @file_share
    assert_response :success
  end

  test "should update file_share" do
    patch :update, id: @file_share, file_share: { file_url: @file_share.file_url, user: @file_share.user }
    assert_redirected_to file_share_path(assigns(:file_share))
  end

  test "should destroy file_share" do
    assert_difference('FileShare.count', -1) do
      delete :destroy, id: @file_share
    end

    assert_redirected_to file_shares_path
  end
end
