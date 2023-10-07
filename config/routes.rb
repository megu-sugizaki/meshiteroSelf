Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  resources :posts
  resources :users
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
end