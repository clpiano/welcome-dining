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
      resources :reservations
    end
  end
  #飲食店用
  namespace :restaurant do
    root to: 'homes#show'
    resources :homes, only: [:show]
    resources :posts
    resources :reservations, only: [:index, :show, :create]
    resources :customers
  end
end
