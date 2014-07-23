class OrderMailer < ActionMailer::Base
  default from: "orders@joyhaus.com"

  def send_receipt(order)
    @order = order
    mail(subject: "Order Receipt", to: order.email)
  end
end
