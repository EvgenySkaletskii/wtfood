Rails.application.routes.draw do
  resources :recipes
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
