Rails.application.routes.draw do
  
  # admin/homes の routing
    get 'admin/homes' => "admin/homes#index"

  get 'orders/index'
  get 'orders/show'
  # CART ITEM-PAGE ROUTINGS
  resources :cart_items, only: [:index, :create, :update, :destroy]
  # TT
  post "cart_item/create_cart_session" => "cart_items#create_cart_session"
  # HASSYS
  get "cart_item/input" => "cart_items#input"
  get "cart_item/display" => "cart_items#display"
  post "cart_item/display" => "cart_items#display"
  get "cart_item/thanks" => "cart_items#thanks"
  delete "cart_item/destroy_all" => "cart_items#destroy_all"
  
  # TOP PAGE ROUTING
  root 'homes#index'

  # ADMIN-PAGE ROUTINGS
  namespace :admin do
    resources :items, only: [:index, :show, :new, :edit, :create, :update, :destroy]
    resources :genres, only: [:index, :edit, :update, :create]
    resources :orders, only: [:index, :show, :update] do
      collection do
        get :index_today
      end
    end
    resources :order_details, only: [:update]
  end
  
  # EC-PAGE ROUTINGS
  resources :items, only: [:index, :show, :create]
  resources :genres, only: [:show]
  resources :orders, only: [:index, :show, :create]
  
  # CART ITEM-PAGE ROUTINGS
  resources :cart_items, only: [:index, :input, :display, :thanks, :create, :update, :destroy]
  
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
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

    # admin/end_users の routing
    namespace :admin do
      resources :end_users, only: [:index, :show, :edit, :update]
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end