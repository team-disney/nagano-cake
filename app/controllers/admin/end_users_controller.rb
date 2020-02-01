class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

    # 更新すると end_user　の show へ行ってしまう。なぜ、、、
  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(end_user_params)
    redirect_to admin_end_user_path(@end_user), notice: "You have updated your infomation successfully."
  end

    # STRONG PARAMETERS
    private

    def end_user_params
      params.require(:end_user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :zipcpde, :address, :phone_number, :email)
    end
end
