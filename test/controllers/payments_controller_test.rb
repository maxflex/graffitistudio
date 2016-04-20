require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  test "should get yandex" do
    get :yandex
    assert_response :success
  end

end
