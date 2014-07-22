class Order < ActiveRecord::Base
  before_save :set_subtotal

  has_many :line_items, dependent: :destroy
  has_one :order_payment

  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :postal_code
  validates_presence_of :phone_number
  validates_presence_of :payment_method
  validates_presence_of :shipping_method

  PAYMENT_TYPES = ["Bank Transfer"]
  STATUS_TYPES = ["Waiting For Payment", "Processing Payment", "Payment Received", "Shipping Order", "Success"]
  SHIPPING_TYPES = ["Normal Mail (free)","Registered Mail (extra cost)"]

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def pending_payment
    status == 1
  end

  private
  def set_subtotal
    subtotal = line_items.map { |li| li.total_price }.sum
  end
end
