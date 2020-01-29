class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @new_item = Item.new
  end

  def edit
    @edit_item = Item.find(params[:id])
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