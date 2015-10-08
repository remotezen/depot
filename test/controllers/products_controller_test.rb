require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:ruby)
    @update = {
      title: 'Lorem Ipsum',
      description: "weebles don't fall down",
      image_url: 'lorem.jpg',
      price: 19.99

    }
  end
  require 'test_helper'
  test "should get index" do
    get :index
    assert_response :success
  end
  test "should get new" do
    get :new
    assert_response :success
  end
  test "should create new product" do
    assert_difference 'Product.count', 1 do
      post :create, product: @update
    end
  end
  test "should update product" do
    patch :update,  id: @product.id,
    product: @update
    assert_not flash.empty?
    assert_redirected_to product_path(assigns(:product))
  end
  test "product index should contain these elements" do
    get :index
    assert_select 'table tr.list_line_odd'

  end
end
