Rails.application.routes.draw do
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

  resources :posts
end
