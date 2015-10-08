json.array!(@product.orders) do |order| 
  json.address  order.address
  json.name order.name
  json.email order.email
  json.line_items do
    json.array!(order.line_items) do |item|
      json.title item.product.title
      json.price number_to_currency(item.product.price)
      json.quantity item.quantity
      json.sub_total number_to_currency(item.total_price)
    end
      
  end
      json.total number_to_currency(order.line_items.map(&:total_price).sum)
end
