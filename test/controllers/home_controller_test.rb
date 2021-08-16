require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "home index should be mapped to root" do
    get root_url
    assert_response :success
  end
end
