class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart
#  before_create :assign_price
  
  def total_price
    product.price * quantity
  end
  
  def assign_price
    self.price = product.price
  end
end
