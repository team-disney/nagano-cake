Rails.application.routes.draw do
  namespace :admin do
    resources :genres, only: [:index, :edit, :update, :create]
  end
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




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
