Rails.application.routes.draw do

devise_for :admins
devise_for :users
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  root to: "products#index"
  
  resources :products, only: [:show] do
    scope module: :products do
      resources :add_to_carts, only: [:create]
      resources :delete_in_carts, only: [:create]
    end
  end
      
  resource :cart, only: [:show] 
  
  resource :charge, only: [:create]

   namespace :admins do
      root to: "toppages#index"
      resources :products, only: [:new, :create]
      resource :sales_record, only: [:show]
   end
   
end
