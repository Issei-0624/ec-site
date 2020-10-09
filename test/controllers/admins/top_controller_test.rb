require 'test_helper'

class Admins::TopControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_top_index_url
    assert_response :success
  end

end
