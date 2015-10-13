require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  def setup
    @line_item = line_items(:first_item)
  end
  test "should create line_item" do
    assert_difference('LineItem.count') do
     xhr :post, :create, product_id: products(:ruby).id
    end
    assert_response :success
    assert_select_jquery :html, '#cart' do
     assert_select 'tr#current_item td', /Programming Ruby 1.9/
    end
  end
  test "should update line_items" do
    patch :update, id: @line_item, line_item: {product_id: @line_item.product_id}
    assert_redirected_to line_item_path(assigns(@line_item))
  end

  test "should total price" do
  end
end
