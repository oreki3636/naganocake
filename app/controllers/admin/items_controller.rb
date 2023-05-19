class Admin::ItemsController < ApplicationController

  def new
    @item=Item.new
  end

  def create
    @item=Item.find(params[:id])
    if @@item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def index
    @items=Item.all
  end
end
