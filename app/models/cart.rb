class Cart < ActiveRecord::Base
  
  has_many :line_items, dependent: :destroy
  
  def add_product(product_id, product_price)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity +=1
    else
      current_item = line_items.build(product_id: product_id,
                                      price: product_price)
      line_items << current_item
    end
    current_item
  end
  def decrement_quantity(product_id)
    current_item = line_items.find_by(product_id: product_id)
      if current_item
        quantity = current_item.quantity
        if quantity > 1
          current_item.quantity -= 1
          current_item.save
        else
          current_item.delete
        end
      else
        session[:cart_id] = nil
        line_items = []
      end
  end
  
  
  def total_price
    line_items.to_a.sum {|i| i.total_price}
  end
  

end
