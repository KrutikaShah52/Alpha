Rails.application.routes.draw do
  resources :alpha_scaffolds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'alpha_scaffolds#index'
end
