class Admin::ItemsController < ApplicationController

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def update
    @item=Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path(@item.id)
    else
      render:edit
    end
  end

  def edit
    @item=Item.find(params[:id])
  end

  def show
    @item=Item.find(params[:id])
  end

  def index
    @items=Item.all
  end

  private
  def item_params
  params.require(:item).permit(:image,:name,:introduction,:price)
  end
end
