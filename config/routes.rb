Rails.application.routes.draw do
  # TOP PAGE ROUTING
  root 'homes#index'

  # ADMIN-PAGE ROUTINGS
  namespace :admin do
    resources :items, only: [:index, :show, :new, :edit, :create, :update, :destroy]
    resources :genres, only: [:index, :edit, :update, :create]
  end
  
  # EC-PAGE ROUTINGS
  resources :items, only: [:index, :show]
  resources :genres, only: [:show]
  
  # DEVISE ROUTINGS
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
  resources :end_users, only: [:show, :edit, :update, :destroy] do
    collection do
      get :confirm
    end
  end

  # address の routing. soft_delete は未作成。
  resources :addresses, only: [:index, :edit, :create, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
