class EndUsersController < ApplicationController


  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
    # 他のユーザー情報を変更できないようにする
    if @end_user != current_end_user
      redirect_to end_user_path(current_end_user)
    end
  end

  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(end_user_params)
    redirect_to end_user_path(@end_user)  #end_user のマイページの戻る
  end

  def confirm
  end

  def changepassword
  end

  def leave
  end

  private
    def end_user_params
        params.require(:end_user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :zipcpde, :address, :phone_number, :email)
    end

end
