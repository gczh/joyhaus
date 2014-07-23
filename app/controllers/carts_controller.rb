class CartsController < ApplicationController
  include CurrentCart

  # before_action :set_cart, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  before_action :set_cart, only: [:index, :destroy, :checkout, :empty, :update]

  def index
  end

  def manage
    @carts = Cart.all
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  def checkout
    session[:order_review] = nil
    if @cart.line_items.empty?
      redirect_to carts_url, notice: 'Your cart is empty'
    end
    @order = Order.new
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cart }
      else
        format.html { render action: 'new' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to carts_url, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def empty
    empty_cart_message = 'Your cart cant be emptied. Please try again.'
    if @cart.id == session[:cart_id]
      if @cart.clear_all
        empty_cart_message = 'Your cart has been emptied'
      end
    end

    respond_to do |format|
      format.html { redirect_to carts_url, notice: empty_cart_message }
      format.json { head :no_content }
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    destroy_cart_message = 'Your cart cant be removed. Please try again.'
    if @cart.id == session[:cart_id]
      if @cart.destroy
        destroy_cart_message = 'Your cart has been removed'
      end
    end

    respond_to do |format|
      format.html { redirect_to carts_url, notice: destroy_cart_message }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_cart
    #   @cart = Cart.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(line_items_attributes: [:id, :quantity])
    end

    def invalid_cart
      invalid_cart_message = "You have tried to access an invalid cart! Clear your browser cache and try again. If it persists, contact us"
      logger.error "Attempt to access an invalid cart #{params[:id]}"
      unless (cart_id = session[:cart_id]).nil?
        redirect_to cart_path(Cart.find(cart_id)), notice: invalid_cart_message
      else
        redirect_to root_path, notice: invalid_cart_message
      end
    end
end
