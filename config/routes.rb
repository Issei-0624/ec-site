Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}
  devise_for :users
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  root to: "home#index"

  resources :admin, only: [:index]
    namespace :admin do
      resources :products, only: [:new,:show,:create] 
    end
  
  resources :products, only: [:new,:show,:create] do
    scope module: :products do
      resources :add_to_carts, only: [:create]
      resources :delete_in_carts, only: [:create]
    end
  end
      
  resource :cart, only: [:show] 
  
  resource :charge, only: [:create]

    
  
end
