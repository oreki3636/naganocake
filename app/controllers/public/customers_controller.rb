class Public::CustomersController < ApplicationController
  def show
    @customer=current_customer
  end

  def edit
    @customer=current_customer
  end
  def update
    @customer=current_customer
    if @customer.update(customer_params)
      redirect_to customer_path
    else
      render :edit
    end
  end
end
