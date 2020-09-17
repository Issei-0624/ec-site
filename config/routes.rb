Rails.application.routes.draw do
  get 'products/new'
  get 'products/create'
  get 'products/destroy'
  get 'home/index'
  devise_for :users
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  root to: "home#index"
  
  resources :products, only: [:create, :destroy,:new]
end
