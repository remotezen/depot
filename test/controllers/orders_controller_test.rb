require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  def setup
    @order = orders(:one)
    @hash = {
      name:"fred hudson",
      address:"440 nipigon st oshawa on",
      email: "remotezen@bell.net",
      pay_type: "Check"
    }
  end
  
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
    session[:cart_id] = item.cart_id
    get :new 
    assert_response :success
  end
  
  test "should get edit" do
    put :edit, id: @order
    assert_response :success
    assert_template "orders/edit"
  end
 
  test "should update order" do
    patch :update, id: @order.id, 
    order: @hash 
    assert_not flash.empty?
    assert_redirected_to orders_path(assigns(@hash))
  end



end
