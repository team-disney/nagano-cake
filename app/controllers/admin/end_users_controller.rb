class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin_user!

  # with_deleted は論理削除したデータの含めての呼び出し
  def index
    @end_users = EndUser.with_deleted.all
  end

  def show
    @end_user = EndUser.with_deleted.find(params[:id])
  end

  def edit
    @end_user = EndUser.with_deleted.find(params[:id])
  end

  # 0 = 有効, 1 = 退会済み
  def update
    @end_user = EndUser.with_deleted.find(params[:id])
    @end_user.update(end_user_params)
    # 会員ステータスが 1 (退会済み) なら論理削除
    if end_user_params[:deleted_at].to_i == 1
      @end_user.destroy
    # 会員ステータスが 0 (有効) なら deleted_at は nil
    elsif end_user_params[:deleted_at].to_i == 0
      end_user_params[:deleted_at] == nil
      @end_user.update(end_user_params)
    end
      redirect_to admin_end_user_path(@end_user), notice: "You have updated your infomation successfully."
  end

    # STRONG PARAMETERS
    private

    def end_user_params
      params.require(:end_user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :zipcode, :address, :phone_number, :email, :deleted_at)
    end
end
