require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  setup do
    @cart = carts(:first_cart)
    
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post :create, cart: {  }
    end
    assert_redirected_to cart_path(assigns(:cart))
  end
  test "should edit cart"  do 
    get :edit, id: @cart
    assert_response :success
  end
  test "should update cart" do 
     patch :update, id: @cart, cart: {}
     assert_redirected_to cart_path(assigns(:cart))
  end
    

  test "should destroy cart" do
    assert_difference('Cart.count', -1) do
      session[:cart_id] = @cart.id
      delete :destroy, id: @cart 
    end
      assert_redirected_to root_path
  end
end
