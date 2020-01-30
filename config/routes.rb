Rails.application.routes.draw do


  # トップページの routing
  root 'homes#index'

  # end＿user, admin＿users の devise の routing
  devise_for :admin_users, controllers: {
    sessions:      'admin_users/sessions',
    passwords:     'admin_users/passwords',
    registrations: 'admin_users/registrations'
  }
  devise_for :end_users, controllers: {
    sessions:      'end_users/sessions',
    passwords:     'end_users/passwords',
    registrations: 'end_users/registrations'
  }

  # end_users の routing
  resources :end_users, only: [:show, :edit, :update]
  get "end_user/confirm" => "end_users#confirm"
  get "end_user/changepassword" => "end_users#changepassword"

    # address の routing. soft_delete は未作成。
    resources :addresses, only: [:index, :edit, :create, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
