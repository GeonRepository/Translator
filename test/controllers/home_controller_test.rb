require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get test" do
    get :index
    assert_response :success
  end

end
