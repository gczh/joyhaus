class Admin::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.friendly.find_by_reference_id(params[:id])
    end
end
