Rails.application.routes.draw do
  
  root 'tops#index'
  # [confirm]は商品購入確認ページのルーティング
  resources :items, only: [:show, :confirm]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
