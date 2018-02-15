Rails.application.routes.draw do
  resources :alpha_scaffolds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'alpha_scaffolds#home'
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'

  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'home', to: 'alpha_scaffolds#home'
end
