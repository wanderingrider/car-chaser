Rails.application.routes.draw do
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index" 

  resources :items  do
    resources :maps
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search' 
    end
  end
end
