Rails.application.routes.draw do

  devise_for :users,controllers: {
    sessions:     'publics/sessions',
    passwords:     'publics/passwords',
    registrations: 'publics/registrations',
  }



  namespace :public do
    get 'homes/top'
    get 'homes/about'
    resources :users, only:[:show,:edit,:update,:destroy] do
      get 'users/confile'
      resource :chages, only:[:create,:new]
    end
    resources :posts do
      resource :favorites, only:[:create,:destroy]
      resources :comments, only:[:create,:edit,:update,:destroy]
      resource :purchases, only:[:create]
    end
    resources :maps, only:[:index]
    resources :homes, only:[:top,:about]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
