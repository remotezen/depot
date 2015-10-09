class OrderNotifier < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received
    @greeting = "Hi"
    mail to: "currentlyremote@gmail.com"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped
    @greeting = "Hi"
    mail to: "currentlyremote@gmail.com"
  end
  def received(order)
    @order = order
    mail to: order.email, subjects: "Pragmatic Store Order Confirmation"
  end
  
  def shipped(order)
    @greeting = "Hi"
    @order = order
    mail to: order.email, subject: 'Shipped'
    
    
  end
end
