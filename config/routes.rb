# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'publics/sessions',
    passwords: 'publics/passwords',
    registrations: 'publics/registrations'
  }
  
  namespace :admin do
    get 'homes/top'
    resources :users, only: %i[index edit update show destroy]
    resources :posts, only: %i[index show edit update destroy]
    resources :tags, only: %i[index edit update destroy]
    resources :comment, only: %i[edit update destroy]
    resources :maps, only: [:index]
    resource :homes, only: [:top]
  end

  namespace :public do
    
    get 'homes/top'
    get 'homes/about'
    resources :users, only: %i[show edit update destroy] do
      get 'users/confile'
      resource :chages, only: %i[create new]
      resources :posts, only: %i[new create]
      resources :tags, only: [:create]
    end
    resources :posts, only: %i[index show edit update destroy] do
      resources :tags, only: [:new]
      resource :favorites, only: %i[create destroy]
      resources :comments, only: %i[create destroy]
      resource :purchases, only: [:create]
      resources :post_tags, only: %i[create destroy]
    end
    resources :homes, only: %i[top about]
    resources :maps, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
