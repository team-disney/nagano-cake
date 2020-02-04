class AddressesController < ApplicationController
  before_action :authenticate_end_user!

  def index
    @address_new = Address.new
    @addresses = Address.all
    # 全表示させたいので each を使う。
    @addresses.each do |f|
      f.zipcode.insert(3, '-').split('-')
    end
  end

  def create
    @address_new = Address.new(address_params)
    @address_new.end_user_id = current_end_user.id
    if@address_new.save
      redirect_to addresses_path, notice: "You have created address successfully."
    else
      # ERROR MASSAGE
      flash[:alert] = "Save Error!"
      # RENDER VARIABLES
      # 全表示
      @addresses = Address.all
      render :index
    end

  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if@address.update(address_params)
      redirect_to addresses_path, notice: "You have updatad your address successfully."
    else
      # ERROR MASSAGE
      flash[:alert] = "Save Error!"
      # RENDER VARIABLES
      render :edit
    end
  end

  # 論理削除
  def destroy
    @address = Address.find(params[:id])
		@address.destroy
		redirect_to addresses_path, notice: "Your address was successfully destroyed."
  end

  private

    def address_params
      params.require(:address).permit(:zipcode, :address, :name)
    end

end
