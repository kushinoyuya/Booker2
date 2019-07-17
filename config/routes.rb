Rails.application.routes.draw do
  root to: 'books#top'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/about" => "books#about"

  resources :users
  resources :books
end
