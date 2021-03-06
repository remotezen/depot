class Order < ActiveRecord::Base
  PAYMENT_TYPES = ["Check",  "Credit cart", "Purchase order"]
  has_many :line_items, dependent: :destroy
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
  after_update :enter_ship_date



  
  
  def  add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
  private
  
  def enter_ship_date
    self.ship_date = Time.now
    
  end
end
    
