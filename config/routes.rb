Rails.application.routes.draw do
  root "pages#home"
  resources :users, only: [:new, :create, :edit, :update]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  get '/profile', to: 'users#profile', as: :profile 
 

  resources :lists

  resources :movies do 
    resources :reviews
  end 

  resources :reviews, only: [:create, :update]
  

  get '/auth/facebook/callback' => 'sessions#fb_create'
  
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
