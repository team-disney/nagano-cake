class EndUsersController < ApplicationController


  def show
    @end_user = EndUser.find(params[:id])
    # zipcode にハイフンを入れる
    @end_user.zipcode = 'xxxyyyy'
    @end_user.zipcode.insert(3, '-').split('-')
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
    if@end_user.update(end_user_params)
      redirect_to end_user_path(@end_user), notice: "You have updatad user successfully."
    else
      # ERROR MASSAGE
      flash[:alert] = "Save Error!"
      # RENDER VARIABLES
      render :edit
    end
  end

  def confirm
  end

  # 論理削除
  def destroy
    end_user = EndUser.find(params[:id])
    end_user.destroy
		redirect_to root_path, notice: "Your account was successfully destroyed."
  end

  private
    def end_user_params
        params.require(:end_user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :zipcode, :address, :phone_number, :email)
    end

end
