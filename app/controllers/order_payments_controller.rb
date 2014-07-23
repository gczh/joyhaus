class OrderPaymentsController < ApplicationController

  before_action :set_order, only: [:create]

  def create
    @order.build_order_payment(order_payment_params)
    if @order.save && @order.update(status: 1)
      redirect_to @order, notice: 'Payment info was successfully updated. Please wait while we review it.'
    else
      redirect_to @order, notice: 'Payment info was not updated. Please retry again.'
    end
    # how to save datetime_select fields? is there quick way or manually set?
  end

  private
    def set_order
      @order = Order.find_by(id: params["order_id"])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_payment_params
      params.require(:order_payment).permit(:transaction_id, :ibanking_nick, :transaction_datetime)
    end
end
