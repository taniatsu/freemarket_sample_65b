Rails.application.routes.draw do
  
  root 'tops#index'
  get 'items/show', to: 'items#show'
  # ↓商品購入確認ページ ルーティング
  get 'items/confirm', to: 'items#confirm'
  # resources :items, only: :show

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
