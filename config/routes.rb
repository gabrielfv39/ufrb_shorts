Rails.application.routes.draw do
  devise_for :users
  
  resources :videos do
    resources :reactions, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  
  get '/shorts', to: 'videos#index', category: 'short', as: 'shorts'
  get '/pilots', to: 'videos#index', category: 'pilot', as: 'pilots'
  
  root 'videos#index'
end