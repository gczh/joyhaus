class Order < ActiveRecord::Base
  before_save :set_subtotal

  private
  def set_subtotal
    subtotal = line_items.to_a { |li| li.total_price }.sum
  end
end
