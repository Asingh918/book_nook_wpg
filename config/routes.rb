Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'products#index'
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  get  '/cart',              to: 'cart#show',   as: 'cart'
  post '/cart/add',          to: 'cart#add',    as: 'cart_add'
  delete '/cart/remove',     to: 'cart#remove', as: 'cart_remove'
  patch '/cart/update',      to: 'cart#update', as: 'cart_update'
end
