class AddressesController < ApplicationController
  def index
    @address_new = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    @address.save
    redirect_to addresses_path, notice: "You have created address successfully."
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path, notice: "You have updatad your address successfully."
  end

  # 論理削除
  def soft_delete
  end

  private

    def address_params
      params.require(:address).permit(:zipcode, :address, :name)
    end

end
