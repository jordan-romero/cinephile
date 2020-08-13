Rails.application.routes.draw do
  root "pages#home"
  
  resources :users, only: [:new, :create, :edit, :update]
  get '/profile', to: 'users#profile', as: :profile 
  get 'login', to: 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#fb_create'
  
  
  resources :lists

  resources :movies do 
    resources :reviews
  end 


  resources :reviews, only: [:create, :update]
  

  get '/users/most_reviews' => 'users#most_reviews', as: :most_reviews
  
  
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
