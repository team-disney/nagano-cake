class ItemsController < ApplicationController

  def index
    # ALL-ITEMS
    @activated_items = Item.where(status: 1)
    @pagenated_items = @activated_items.page(params[:page]).per(20)

    # ONLY ACTIVE-GENRES
    @active_genres = Genre.where(status: 1)
  end

  def show
    # ONLY ITEM THIS PAGES
    @item = Item.find(params[:id])

    # ONLY ACTIVE-GENRES --- GENRE FILTERED MENU
    @active_genres = Genre.where(status: 1)

    # MAKE ADD-CART-ITEM INSTANCE --- TO CREATE CART-ITEMS
    @add_cart_item = CartItem.new
  end

  def create
    add_cart_item = CartItem.new(add_cart_item_params)
    add_cart_item.end_user_id = current_end_user.id
    if add_cart_item.save
      # redirect_to cart_items_path, notice: "商品を追加しました。"
      redirect_to cart_items_path, notice: "#{add_cart_item.item.name} を #{add_cart_item.amount} 個 カートに追加しました。"

    else
      # FOR VALIDATION
      # render :show
    end
  end

  # STRONG PARAMETERS
  private

  def add_cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end