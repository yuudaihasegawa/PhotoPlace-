Rails.application.routes.draw do

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
    get 'homes/top'
    resources :users, only:[:index,:edit,:update,:show,:destroy]
    resources :posts, only:[:index,:show,:edit,:update,:destroy]
    resources :tags, only:[:index,:edit,:update,:destroy]
    resources :comment, only:[:edit,:update,:destroy]
    resources :maps, only:[:index]
    resource :homes, only:[:top]
  end



  namespace :public do
    get '/map_request', to: 'maps#index', as: 'map_request'
    get 'homes/top'
    get 'homes/about'
    resources :users, only:[:show,:edit,:update,:destroy] do
      get 'users/confile'
      resource :chages, only:[:create,:new]
      resources :posts, only:[:new,:create]
      resources :tags, only:[:create]
    end
    resources :posts, only:[:index,:show,:edit,:update,:destroy] do
      resources :tags, only:[:new]
      resource :favorites, only:[:create,:destroy]
      resources :comments, only:[:create,:destroy]
      resource :purchases, only:[:create]
      resources :post_tags, only:[:create,:destroy]
    end
    resources :homes, only:[:top,:about]
    resources :maps, only:[:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
