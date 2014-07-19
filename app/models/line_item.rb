class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  validates_presence_of :cart

  before_save :set_price

  def total_price
    quantity * product.price
  end

  private
  def set_price
    price = product.price
  end
end
