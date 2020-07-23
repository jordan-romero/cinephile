Rails.application.routes.draw do
  resources :reviews, only: [:create, :update, :destroy]
  resources :users
  resources :lists
  resources :movies do 
    resources :reviews, only: [:show, :new, :edit, :index]
  end 
  root to: 'pages#home'

  #post "search_movies" => "movies#search", as: :search
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
