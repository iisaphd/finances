require 'test_helper'

class DatabaseControllerTest < ActionController::TestCase
  test "should get clear" do
    get :clear
    assert_response :success
  end

end
