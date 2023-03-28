require "test_helper"

class WebSocketDemoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get web_socket_demo_index_url
    assert_response :success
  end
end
