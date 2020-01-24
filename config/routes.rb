Rails.application.routes.draw do

  root 'public/homes#top'
  get 'public/homes/top'
  get 'public/homes/about'
  resources :homes, only:[:top,:about]

  devise_for :admins,controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations',
  }

  devise_for :users,controllers: {
    sessions:     'publics/sessions',
    passwords:     'publics/passwords',
    registrations: 'publics/registrations',
  }

  namespace :admin do
    get '/map_request', to: 'maps#index', as: 'map_request'
    resources :users, only:[:index,:edit,:update,:show,:destroy]
    resources :posts, only:[:index,:show,:destroy]
    resources :tags, only:[:show,:destroy]
    resources :comment, only:[:edit,:update,:destroy]
    resources :maps, only:[:index]
  end



  namespace :public do
    get '/map_request', to: 'maps#index', as: 'map_request'

    resources :users, only:[:show,:edit,:update,:destroy] do
      get 'users/confile'
      resources :posts, only:[:new,:create]
      resources :tags, only:[:create]
    end
    resources :posts, only:[:index,:show,:edit,:update,:destroy] do
      resources :tags, only:[:new]
      resource :favorites, only:[:create,:destroy]
      resources :comments, only:[:new,:create,:destroy]
      resources :post_tags, only:[:create,:destroy]
    end

    resources :maps, only:[:index]
    resources :tags, only:[:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
