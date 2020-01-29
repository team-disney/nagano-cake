Rails.application.routes.draw do

  # ROOT
  root 'homes#index'

  # ADMIN_USERS
  namespace :admin do
    resources :items, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  end
  
  # END_USERS
  resources :items, only: [:index, :show]

  
  # DEVISES
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




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
