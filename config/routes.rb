Rails.application.routes.draw do
  resources :likes, only: [:create, :destroy]
  resources :recipes
  resources :ingredients, only: [], param: :index do
    member do
      delete "(:id)" => "ingredients#destroy", as: ""
    end
  end
  resources :products
  resources :comments
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root "recipes#index", as: :authenticated_root
    end

    unauthenticated do
      root "devise/sessions#new", as: :unauthenticated_root
    end
  end
  get "home/index"
  root "home#index"
end
