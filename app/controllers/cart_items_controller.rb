class CartItemsController < ApplicationController
  def index
    # カートアイテムを作成
    @cart_item = CartItem.new

    # ユーザーにカートアイテムを持たせる
    user = current_end_user.id
    # @user_have_cart_items = user.cart_item
    
    @item = Item.where(id: 1) #後ほど修正予定
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
  end

  def destroy #現段階では削除がルーティングエラーになります
    item = Item.find(params[:id])
    if  item.end_user_id == current_end_user.id
        item_id.destroy
        redirect_to cart_items_path
    end
  end

  def input
  end

  def display
  end

  def thanks
  end

  private

  def cart_item__params
    params.require(:cart_item).permit(:amount)
  end
end
