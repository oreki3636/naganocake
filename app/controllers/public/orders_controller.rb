class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @customer=current_customer
  end

  def create
    @order=Order.new(order_params)
    @order.customer_id = current_customer.id
    #binding.pry
    @order.save
    current_customer.cart_items.each do |cart_item|
      order_detail=OrderDetail.new
      order_detail.item_id=cart_item.item_id
      order_detail.order_id=@order.id
      order_detail.quantity=cart_item.amount
      order_detail.price=cart_item.item.taxprice
      order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to thanks_path
  end

  def confirm
    @cart_items=current_customer.cart_items
    @order=Order.new(order_params)
    @total=0
    @order.postage=800
    if params[:order][:select_address]=="address"
      @order.shipping_postal_code=current_customer.postal_code
      @order.shipping_address=current_customer.address
      @order.shipping_name=current_customer.fullname
    end
  end

  def index
    @orders=current_customer.orders
  end

  def show
    @order=Order.find(params[:id])
    @total=0
  end

  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:shipping_name,:shipping_postal_code,:shipping_address,:method_of_payment,:postage,:billing_amount)
  end
end
