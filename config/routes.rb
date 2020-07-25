Rails.application.routes.draw do
  resources :users
  resources :lists
  resources :movies do 
    resources :reviews
  end 
  resources :reviews, only: [:create, :update, :destroy]
  root to: 'pages#home'

  get "/search", to: "movies#index"

  #post "/search" => "Omdbservice#search", as: :search
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
