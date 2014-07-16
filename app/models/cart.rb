class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end

  def clear_all
    line_items.destroy_all
  end

  def subtotal
    line_items.map { |li| li.product.price * li.quantity }.sum
  end
end
