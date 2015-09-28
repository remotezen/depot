require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  def setup
    @product = products(:ruby)
  end
  test "should get index" do
    get :index
    assert_response :success
    assert_select "div.entry"
    assert_select "img"
    assert_select "span.price", text: sprintf("$%0.02f",@product.price)
    assert_select '.price', /\$[,\d]+\.\d\d/
    assert_match @product.image_url, "ruby.png"
    assert_select '#main .entry' , 3
    assert_select 'h3', 'Programming Ruby 1.9'
    
  end

end
