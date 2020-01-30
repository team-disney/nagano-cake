class Admin::ItemsController < ApplicationController
  def index
    # ALL-ITEMS
    @items = Item.all
    # ALL-GENRES
    @genres = Genre.all
  end

  def show
    # ONLY ITEM THIS PAGE
    @item = Item.find(params[:id])
  end

  def new
    # MAKE NEW ITEM-REGISTER INSTANCE
    @new_item = Item.new

    # ONLY ACTIVE-GENRES
    active_genres = Genre.where(status: 1)
    # AND GENRE-NAMES TO ARRAY --- SELECT GENRES
    @arrayed_active_genres = []
    active_genres.each do |active_genre|
      @arrayed_active_genres.push(
        [ active_genre.name,
          active_genre.id ]
      )
    end

    # ITEM STATUS TO ARRAY --- SELECT STATUS
    @arrayed_item_statuses = Item.statuses.keys.to_a
  end

  def edit
    # FIND ITEM-EDIT INSTANCE
    @edit_item = Item.find(params[:id])

    # ONLY ACTIVE-GENRES
    active_genres = Genre.where(status: 1)
    # AND GENRE-NAMES TO ARRAY --- SELECT GENRES
    @arrayed_active_genres = []
    active_genres.each do |active_genre|
      @arrayed_active_genres.push(
        [ active_genre.name,
          active_genre.id ]
      )
    end

    # ITEM STATUS TO ARRAY --- SELECT STATUS
    @arrayed_item_statuses = Item.statuses.keys.to_a
  end

  def create
    @new_item = Item.new(item_params)
    if @new_item.save
      redirect_to admin_item_path(@new_item), notice: "You have creatad item successfully."
    else
      # FOR VALIDATION
      render :new
    end
  end

  def update
    @edit_item = Item.find(params[:id])
    # Update Validations
    if @edit_item.update(item_params)
      redirect_to admin_item_path(@edit_item), notice: "You have updatad user successfully."
    else
      render :edit
    end
  end

  # MAY DON'T USE
  def destroy
  end

  # STRONG PARAMETERS
  private

  def item_params
    params.require(:item).permit(:name, :genre_id, :caption, :status, :price, :image)
  end
end
