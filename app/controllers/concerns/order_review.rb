module OrderReview
  extend ActiveSupport::Concern
  
  private
  def set_order_review
    binding.pry
    @order_review = Order.new(session[:order_review])
  rescue ActiveRecord::RecordNotFound
    order_params["status"] = 0
    @order_review = Order.new(order_params)
    session[:order_review] = @order_review.attributes
    redirect_to review_orders_url
  end
end