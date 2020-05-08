Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
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
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'confirm'
    end
    # 購入
    resources :purchases, only: [:index] do
      collection do
        post 'pay', to: 'purchases#pay'
        get 'done', to: 'purchases#done'
      end
    end
  end

  # カード登録ページのルーティング
  resources :cards, only: [:create, :show, :edit] do
    collection do
      post 'delete', to: 'cards/current_user.id/delete'
      post 'show'
    end
    member do
      get 'confirmation'
    end
  end 
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
