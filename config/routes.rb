# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  resources :users, only: [:edit, :update]
  resources :likes, only: [:create, :destroy]
  resources :recipes do
    collection do
      get "random"
      get "favorite"
    end
  end
  resources :ingredients, only: [], param: :index do
    member do
      delete "(:id)" => "ingredients#destroy", as: ""
      post "/" => "ingredients#create"
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
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => "/sidekiq"
  end
  get "home/index"
  root "home#index"
end
