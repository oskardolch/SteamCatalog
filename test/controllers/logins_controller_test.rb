require "test_helper"

class LoginsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get logins_show_url
    assert_response :success
  end
end
