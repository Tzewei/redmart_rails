Rails.application.routes.draw do
  root 'static_pages#home'

  resources :products
  resources :users

  # static pages routes, not connected to models
  get '/help',    to: 'static_pages#help', as: 'helf'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  # dynamic routes
  get '/signup',  to: 'users#new'


  # login routes
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
