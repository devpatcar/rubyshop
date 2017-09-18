require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  setup do
    @order = orders(:one)
  end

  test "received" do
    mail = OrderMailer.received(@order)
    assert_equal "RubyStore Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["rubyShop@example.com"], mail.from    
  end

  test "shipped" do
    mail = OrderMailer.shipped(@order)
    assert_equal "RubyStore Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["rubyShop@example.com"], mail.from    
  end

end
