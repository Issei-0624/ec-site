require 'test_helper'

class BasketsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get baskets_create_url
    assert_response :success
  end

  test "should get destroy" do
    get baskets_destroy_url
    assert_response :success
  end

  test "should get show" do
    get baskets_show_url
    assert_response :success
  end

end
