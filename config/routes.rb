Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  ActiveAdmin.routes(self)

  root 'products#index'
  resources :products,  only: [:index, :show]
  resources :categories, only: [:show]

  get    '/cart',              to: 'cart#show',              as: 'cart'
  post   '/cart/add',          to: 'cart#add',               as: 'cart_add'
  delete '/cart/remove',       to: 'cart#remove',            as: 'cart_remove'
  patch  '/cart/update',       to: 'cart#update',            as: 'cart_update'

  get    '/checkout',          to: 'checkout#new',           as: 'checkout'
  post   '/checkout/province', to: 'checkout#update_province', as: 'checkout_province'
  post   '/checkout',          to: 'checkout#create',        as: 'checkout_create'
  get    '/orders/:id/confirmation', to: 'orders#confirmation', as: 'order_confirmation'
end
