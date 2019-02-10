Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match '/signin', to: 'users#signin', as: 'signin', via: [:post, :get]

  #resources :users

end
