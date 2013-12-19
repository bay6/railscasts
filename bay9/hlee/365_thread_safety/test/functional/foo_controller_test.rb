require 'test_helper'

class FooControllerTest < ActionController::TestCase
  test "should get bar" do
    get :bar
    assert_response :success
  end

end
