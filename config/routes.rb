Rails.application.routes.draw do
  root 'tops#index'
  resources :users do
    resource :self_address
  end
  resources :items do
    resources :likes
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
