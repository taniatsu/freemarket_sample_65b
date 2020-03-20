Rails.application.routes.draw do
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
    collection do
      get 'confirm'
    end
  end

  # カード登録ページのルーティング
  resources :cards, only: [:create, :show, :edit] do
    member do
      get :confirmation
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
