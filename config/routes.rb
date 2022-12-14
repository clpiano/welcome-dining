Rails.application.routes.draw do
  namespace :public do
    get 'relationships/followings'
  end
  #会員用
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
  #会員用
  scope module: :public do
    root to: 'homes#top'
    #Aboutページ
    get '/about' => 'homes#about', as: 'about'
    get 'posts/search'
    resources :posts, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
    end
    get 'customers/my_page' => 'customers#show', as: 'my_page'
    get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
    patch 'customers/information' => 'customers#update', as: 'update_information'
    resource :customers, only: [:destroy]
    #アカウント退会確認
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    #いいね一覧
    get 'customers/favorites' => 'customers#favorites', as: 'favorites'
    resources :customers, only: [:show, :edit, :update]
    resources :restaurants, only: [:index, :show] do
      #飲食店名検索
      collection do
        get 'search'
      end
      #フォロー機能用
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      #予約
      resources :reservations, only: [:new, :create, :show]
      delete 'reservations/:id' => 'reservations#destroy', as: 'destroy_reservations'
    end
    get 'reservations' => 'reservations#index', as: 'reservations'
    #通知一覧
    resources :notifications, only: [:index, :destroy]
  end

  #飲食店用
  namespace :restaurant do
    root to: 'homes#show'
    #諸注意
    get '/attention' => 'homes#attention', as: 'attention'
    resources :homes, only: [:show]
    resources :posts do
      collection do
        delete 'destroy_all'#投稿全て
      end
    end
    #予約
    get 'reservations' => 'reservations#index', as: 'reserve'
    get 'reservations/search/sort_status', to: 'reservations#search', as: 'sort_status'
    get 'reservation/:id' => 'reservations#show', as: 'reserve_detail'
    patch 'reservation/:id' => 'reservations#update', as: 'update_reservation'
    #通知一覧
    resources :notifications, only: [:index]
  end
end