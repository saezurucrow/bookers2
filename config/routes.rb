Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'

  resources :books, only: [:update, :new, :index, :create, :index, :show, :destroy, :edit]
  resources :users, only: [:new, :index, :show, :edit, :update]
  resources :homes, only: [:index]
  get "home/about" => "homes#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
