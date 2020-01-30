class ItemsController < ApplicationController
  def index
    # ALL-ITEMS
    @items = Item.all

    # ONLY FILTERED ITEMS BY GENRE
    @filtered_items = Item.where(genre_id: @genre)

    # ONLY ACTIVE-GENRES
    @active_genres = Genre.where(status: 1)
  end

  def show
    # ONLY ITEM THIS PAGES
    @item = Item.find(params[:id])

    # MAKE ADD-CART-ITEM INSTANCE --- TO CREATE CART-ITEMS
    @add_cart_item = CartItem.new

    # ONLY ACTIVE-GENRES --- GENRE FILTERED MENU
    @active_genres = Genre.where(status: 1)
  end
end
