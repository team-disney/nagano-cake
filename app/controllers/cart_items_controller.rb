class CartItemsController < ApplicationController
  def index
    # 現在のユーザーのカートアイテムを全て持ってくる
    @current_user_cart_items = CartItem.where(end_user_id: current_end_user.id)
    @cart_items = CartItem.all
    
    @sum_price = 0
    @current_user_cart_items.each do |cart_item|
      @sum_price += cart_item.item.price * cart_item.amount
    end

  end

  # helper_method :current_cart

  # def current_cart
  #   if session[:end_user_id]
  #     @cart = Item.find(session[:end_user_id])
  #   else
  #     render root_path
  #   end
  # end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to input_path(@cart_items)
    else
      @cart_item = CartItem.all
      render action: :index
    end
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
  end

  def display
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
end