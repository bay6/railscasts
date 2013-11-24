require 'test_helper'

class AboutControllerTest < ActionController::TestCase
  test "should get privacy" do
    get :privacy
    assert_response :success
  end

  test "should get license" do
    get :license
    assert_response :success
  end

end
