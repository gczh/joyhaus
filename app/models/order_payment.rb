class OrderPayment < ActiveRecord::Base
  before_destroy :set_order_status

  belongs_to :order

  validates_uniqueness_of :transaction_id
  validates_presence_of :transaction_id
  validates_presence_of :ibanking_nick
  validates_presence_of :transaction_datetime

  private
  def set_order_status
    order.update(status: 0)
  end
end
