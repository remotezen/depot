require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  def setup

    
  end
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@remotezen.org"], mail.to
    assert_equal ["currentlyremote@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Shipped", mail.subject
    assert_equal ["dave@remotezen.org"], mail.to
    assert_equal ["currentlyremote@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
