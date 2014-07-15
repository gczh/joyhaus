class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  before_save :set_price

  def total_price
    quantity * product.price
  end

  private
  def set_price
    price = product.price
  end
end
