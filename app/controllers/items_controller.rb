class ItemsController < ApplicationController
  def index
    # ALL-ITEMS
    # @items = Item.all
    @items = Item.page(params[:page]).per(20)

    # ONLY FILTERED ITEMS BY GENRE
    @filtered_items = Item.where(genre_id: @genre)

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
    @add_cart_item = CartItem.new(add_cart_item_params)
    @add_cart_item.end_user_id = current_end_user.id
    if @add_cart_item.save
      # redirect_to cart_items_path, notice: "商品を追加しました。"
      redirect_to item_path(@add_cart_item), notice: "商品を追加しました。"
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