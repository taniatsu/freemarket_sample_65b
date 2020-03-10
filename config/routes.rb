Rails.application.routes.draw do
  
  root 'tops#index'
  get 'items/show', to: 'items#show'
  get 'items/new', to: 'items#new'

  # resources :items, only: :show

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
