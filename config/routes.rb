Rails.application.routes.draw do
  
  devise_for :users
  
  resources :signup do
    collection do
      get 'registration'
      get 'sms_confirmation'
      get 'sms_confirmation/sms', to: 'signup#sms_confirmation_sms'
      get 'address'
      get 'credit_card'
      get 'done'
      post 'pay'
    end
  end
  

  root 'tops#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
