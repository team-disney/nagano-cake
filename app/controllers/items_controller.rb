class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    # TO VIEW
    @item = Item.find(params[:id])
    # TO MAKE NEW INSTANCE
    @cart_item = CartItem.new
  end
end
