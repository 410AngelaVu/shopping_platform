Rails.application.routes.draw do
  get 'orders/index'
devise_for :users 
namespace :supplier do 
resources :products
end
resources :orders

 
  resources :products, only: [:index, :show] 

resources :users
  	


  root to: 'shop_page#index'
end
