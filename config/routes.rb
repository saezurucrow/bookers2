Rails.application.routes.draw do
  devise_for :users
  root 'post_books#index'

  resources :post_books, only: [:update, :new, :index, :create, :index, :show, :destroy, :edit]
  resources :users, only: [:new, :index, :show, :edit, :update]
  resources :homes, only: [:index, :about]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
