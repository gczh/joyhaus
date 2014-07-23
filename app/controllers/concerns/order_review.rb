module OrderReview
  
  private
  def set_order_review
    @order_review = Order.new(session[:order_review])
    if not @order_review.valid?
      order_params["status"] = 0
      @order_review = Order.new(order_params)
      session[:order_review] = @order_review.attributes
      redirect_to review_orders_url
    else
    end
  end
end