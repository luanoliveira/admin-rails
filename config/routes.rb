Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match '/signin', to: 'users#signin', as: 'signin', via: [:post, :get]
  get '/login', to: 'login#new', as: 'login'
  post '/login', to: 'login#create', as: 'login_create'
  delete '/logout', to: 'login#logout', as: 'logout'
  #resources :users

  get '/dashboard', to: 'application#dashboard', as: 'dashboard'


  get '/operadores', to: 'operadores#index', as: 'operadores'
  match '/operadores/create', to: 'operadores#create', as: 'operadores_create', via: [:post, :get]
  match '/operadores/update/:id', to: 'operadores#update', as: 'operadores_update', via: [:patch, :get]
end
