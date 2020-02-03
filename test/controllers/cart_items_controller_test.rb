require 'test_helper'

class CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cart_items_index_url
    assert_response :success
  end

  test "should get input" do
    get cart_items_input_url
    assert_response :success
  end

  test "should get display" do
    get cart_items_display_url
    assert_response :success
  end

  test "should get thanks" do
    get cart_items_thanks_url
    assert_response :success
  end

end
