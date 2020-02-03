class CartItemsController < ApplicationController
  def index
    # 現在のユーザーのカートアイテムを全て持ってくる
    @current_user_cart_items = CartItem.where(end_user_id: current_end_user.id)
    @cart_items = CartItem.all
    
    @sub_total = 0
    @current_user_cart_items.each do |cart_item|
      @sub_total += cart_item.item.price * cart_item.amount
    end
  end

  def create
    # @cart_item = CartItem.new(cart_item_params)
    # if @cart_item.save
    #   redirect_to cart_item_input_path(@cart_items)
    # else
    #   @cart_item = CartItem.all
    #   render action: :index
    # end

    @order = Order.new(order_params)
      if @order.save
        redirect_to cart_item_thanks_path(@cart_items)
      else
        render action: :input
      end

    # @address = Address.new(address_params)
    #   if @address.save
    #     redirect_to cart_item_display_path(@cart_items)
    #   else
    #     render action: :input
    #   end

  end

  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.update(edit_item_amount_params)
      redirect_to cart_items_path
    end
  end

  def destroy_all
    CartItem.where(end_user_id: current_end_user.id).destroy_all
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
      cart_item.destroy
      redirect_to cart_items_path
  end

  def input
    @order = Order.new
    @address = Address.new
    
  end

  def display
    @current_user_cart_items = CartItem.where(end_user_id: current_end_user.id)
    @cart_items = CartItem.all
    @order = Order.new
    @shipping_price = 800
    @sub_total = 0
    @current_user_cart_items.each do |cart_item|
      @sub_total += cart_item.item.price * cart_item.amount
    end
  end

  def thanks
  end

  private

  def edit_item_amount_params
    params.require(:cart_item).permit(:amount)
  end

  def cart_item_params
    params.require(:cart_item).permit(:end_user_id, :item_id, :amount)
  end

  def order_params
    params.require(:order).permit(:payment_method,:address,:cart_item_id)
  end

  def address_params
    params.require(:address).permit(:address, :name, :zipcode)
  end
end