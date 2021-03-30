Rails.application.routes.draw do
  root 'menu#index'
  resources :users
end
