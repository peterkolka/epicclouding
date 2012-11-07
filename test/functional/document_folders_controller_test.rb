require 'test_helper'

class DocumentFoldersControllerTest < ActionController::TestCase
  setup do
    @document_folder = document_folders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:document_folders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create document_folder" do
    assert_difference('DocumentFolder.count') do
      post :create, document_folder: { name: @document_folder.name }
    end

    assert_redirected_to document_folder_path(assigns(:document_folder))
  end

  test "should show document_folder" do
    get :show, id: @document_folder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @document_folder
    assert_response :success
  end

  test "should update document_folder" do
    put :update, id: @document_folder, document_folder: { name: @document_folder.name }
    assert_redirected_to document_folder_path(assigns(:document_folder))
  end

  test "should destroy document_folder" do
    assert_difference('DocumentFolder.count', -1) do
      delete :destroy, id: @document_folder
    end

    assert_redirected_to document_folders_path
  end
end
