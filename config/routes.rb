Rails.application.routes.draw do
  namespace :admin do
    get 'orders/index'
    get 'orders/update'
    get 'orders/show'
  end
  root 'homes#index'
  # end＿user, admin＿users の devise の routing
  devise_for :admin_users, controllers: {
    sessions:      'admin_users/sessions',
    passwords:     'admin_users/passwords',
    registrations: 'admin_users/registrations'
  }
  resources :end_users
  resources :admin_users
  resources :admin_orders
  devise_for :end_users, controllers: {
    sessions:      'end_users/sessions',
    passwords:     'end_users/passwords',
    registrations: 'end_users/registrations'
  }
end
