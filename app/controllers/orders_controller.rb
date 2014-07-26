class OrdersController < ApplicationController
  include CurrentCart, OrderReview

  before_action :set_cart, only: [:review, :create]
  before_action :set_order_review, only: [:build_review, :review, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def build_review
  end

  def review
    @order = Order.new
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    if @order.order_payment.nil?
      @order_payment = OrderPayment.new
    else
      @order_payment = @order.order_payment
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(session[:order_review])
    @order.add_line_items_from_cart(@cart)

    respond_to do |format|
      if @order.save && @order.update(status: 0)
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        session[:order_review] = nil

        OrderMailer.send_receipt(@order).deliver
        
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_path(@order), notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      binding.pry
      @order = Order.friendly.find_by_reference_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:email, :name, :address, :postal_code, :phone_number, :discount, :payment_method, :shipping_method, :notes)
    end
end
