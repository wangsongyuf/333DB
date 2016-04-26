require 'test_helper'

class StartingControllerTest < ActionController::TestCase
  test "should get start" do
    get :start
    assert_response :success
  end

  test "should get results" do
    get :results
    assert_response :success
  end

end
