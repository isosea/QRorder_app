Rails.application.routes.draw do
  root 'menus#index'
  get  '/show',    to: 'menus#show'
  get  '/confirm', to: 'menus#confirm'
  get  '/history', to: 'menus#history'
  get  '/check',   to: 'menus#check'
  resources :users
end
