Rails.application.routes.draw do
  #顧客用
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  #飲食店用
  devise_for :restaurant, controllers: {
    registrations: "restaurant/registrations",
    sessions: "restaurant/sessions"
  }
  #ゲストログイン
  devise_scope :customer do
    post 'customer/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #顧客用
  scope module: :public do
    root to: 'homes#top'
    resources :posts, only: [:index, :show]
    get 'customers/my_page' => "customers#show", as: "my_page"
    get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
    patch 'customers/information' => 'customers#update', as: 'update_information'
    resources :customers, only: [:show, :edit, :update]
    resources :restaurants, only: [:index, :show] do
      collection do
        get 'search'
      end  
      resources :reservations, only: [:new, :create, :show]
      delete 'reservations/:id' => 'reservations#destroy', as: 'destroy_reservations'
    end
    get 'reservations' => 'reservations#index', as: 'reservations'

  end
  #飲食店用
  namespace :restaurant do
    root to: 'homes#show'
    resources :homes, only: [:show]
    resources :posts
    get 'reservations' => 'reservations#index', as: 'reserve'
    get 'reservation/:id' => 'reservations#show', as: 'reserve_detail'
    #get 'reservation/:id/edit' => 'reservations#edit', as: 'edit_reservation'
    patch 'reservation/:id' => 'reservations#update', as: 'update_reservation'
    resources :customers
  end
end
