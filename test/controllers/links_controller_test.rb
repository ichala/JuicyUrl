require "test_helper"

class LinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get links_index_url
    assert_response :success
  end
end
