Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  #ユーザー登録のルーティング
  resources :signup do
    collection do
      get 'registration'
      get 'sms_confirmation'
      get 'address'
      get 'done'
    end
  end
  
  # ルート指定
  root 'tops#index'
  
  # ユーザーページのルーティング
  resources :users do
    resource :self_address
    resources :delivery_addresses
  end

  # 商品ページのルーティング
  resources :items do
    resources :likes
    resources :comments
    resources :images
    collection do
      get 'confirm'
    end
  end

  # カード登録ページのルーティング
  resources :cards
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
