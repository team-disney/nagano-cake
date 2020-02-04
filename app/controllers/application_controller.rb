class ApplicationController < ActionController::Base

  # EndUser と Admin で ログイン後のページ遷移を変える
  def after_sign_in_path_for(resource)
    case resource
    when AdminUser
      admin_homes_path
    when EndUser
      root_path
    end
  end

  # EndUser と Admin で ログアウト後のページ遷移を変える
  def after_sign_out_path_for(resource)
    if resource == :admin_user
      new_admin_user_session_path
    else
      root_path
    end
  end

  # registration のstrong parameters
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :zipcode, :address, :phone_number, :email, :password, :encrypted_password])
  end
end