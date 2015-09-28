require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = products(:ruby)
  end
  
  test "should be valid " do
    assert @product.valid?
  end
  test "title should be present" do
    @product.title = " "
    @product.description = " "
    @product.image_url = " "
    @product.price = " "
    assert_not @product.valid?
  end
  test "product price should not be a negative value" do
    @product.price = -1
    assert_not @product.valid?
  end
  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
    http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    ok.each do |image|
      @product.image_url = image
      assert @product.valid?
    end
    bad.each do |bad|
      @product.image_url = bad
      assert_not @product.valid? 
    end
      
    end
  test "product is not valid unless it has a unique title" do
    product = Product.new(title: products(:ruby).title,
                          description: products(:ruby).description,
                          price: 1,
                          image_url: "fred.gif"
                         )
    assert_not product.valid?
    assert_equal ["has already been taken"], product.errors[:title]


  end

end
