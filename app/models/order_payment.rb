class OrderPayment < ActiveRecord::Base
  belongs_to :order

  validates_uniqueness_of :transaction_id
  validates_presence_of :transaction_id
  validates_presence_of :ibanking_nick
  validates_presence_of :transaction_datetime
end
