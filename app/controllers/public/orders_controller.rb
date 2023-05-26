class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @customer=current_customer
  end

  def create
    @order=Order.new
    @order.postage=800
    @order.save
    redirect_to
  end

  def confirm
    @cart_items=current_customer.cart_items
    @order=Order.new(order_params)
    @total=0
    @order.postage=800


  end

  private
  def order_params
    params.require(:order).permit(:shipping_name,:shipping_postal_code,:shipping_address,:method_of_payment,:postage,:billing_amount)
  end
end
