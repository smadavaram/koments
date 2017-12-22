Rails.application.routes.draw do
  devise_for :profiles
  resources :profiles
  resources :comments
  resources :echos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "echos#index"
end
