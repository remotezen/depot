class OrderNotifier < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received
    @greeting = "Hi"
    mail to: order.email, subject: "Pragmatic Store Order Confirmation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped
    @greeting = "Hi"
    mail to: order.email, subject: 'Shipped'
  end
  
  def received(order)
    @order = order
    mail to: order.email, subject: "Pragmatic Store Order Confirmation"
  end
  
  def shipped(order)
    @greeting = "Hi"
    @order = order
    mail to: @order.email, subject: 'Shipped'
  end
  
  def updated(order)
    @order = order
    mail to: "remotezen@localhost", subject: "An order was changed"
  end
end
