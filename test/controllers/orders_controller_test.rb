require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "require item in cart" do
    get :new 
    assert_redirected_to root_url
    assert_equal flash[:notice], 'Your cart is empty'
  end
  test "should get new" do
    item = LineItem.new
    item.build_cart
    item.product = products(:ruby)
    item.save!
    session[:cart_id] = item.cart.id
    get :new 
    assert_response :success
  end
end
