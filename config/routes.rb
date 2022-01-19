Rails.application.routes.draw do
  # devise_for :users

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  get 'posts/index'
  get 'posts/new'
  get 'posts/show'
  get 'posts/create'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  # root "homes#index"

  get 'posts/search' => 'posts#search'

  resources :posts
end
