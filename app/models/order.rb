class Order < ActiveRecord::Base
  before_save :set_subtotal

  has_many :line_items, dependent: :destroy

  PAYMENT_TYPES = ["Bank Transfer"]
  STATUS_TYPES = ["Waiting For Payment", "Processing Payment", "Payment Received", "Shipping Order", "Success"]
  SHIPPING_TYPES = ["Normal Mail (free)","Registered Mail (extra cost)"]

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  private
  def set_subtotal
    subtotal = line_items.map { |li| li.total_price }.sum
  end
end
