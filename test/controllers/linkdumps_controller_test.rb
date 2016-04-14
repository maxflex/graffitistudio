require 'test_helper'

class LinkdumpsControllerTest < ActionController::TestCase
  setup do
    @linkdump = linkdumps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:linkdumps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create linkdump" do
    assert_difference('Linkdump.count') do
      post :create, linkdump: { url: @linkdump.url }
    end

    assert_redirected_to linkdump_path(assigns(:linkdump))
  end

  test "should show linkdump" do
    get :show, id: @linkdump
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @linkdump
    assert_response :success
  end

  test "should update linkdump" do
    patch :update, id: @linkdump, linkdump: { url: @linkdump.url }
    assert_redirected_to linkdump_path(assigns(:linkdump))
  end

  test "should destroy linkdump" do
    assert_difference('Linkdump.count', -1) do
      delete :destroy, id: @linkdump
    end

    assert_redirected_to linkdumps_path
  end
end
