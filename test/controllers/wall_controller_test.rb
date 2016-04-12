require 'test_helper'

class WallControllerTest < ActionController::TestCase
  test "should get url:string" do
    get :url:string
    assert_response :success
  end

  test "should get desc:string" do
    get :desc:string
    assert_response :success
  end

  test "should get img:string" do
    get :img:string
    assert_response :success
  end

end
