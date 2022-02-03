Rails.application.routes.draw do
  # get 'users/index'
  get 'users/show'
  # devise_for :users

  # devise_for :users do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }
  # devise_for :users, :controllers => {:registrations => 'users/registrations', :omniauth_callbacks =>'users/omniauth' }

  # devise_for :users, controllers: { :registrations => 'users/registrations',omniauth_callbacks: 'users/omniauth' }
    # devise_for :users, controllers: { :registrations => 'users/registrations', sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth' }
  
  get 'posts/index'
  get 'posts/new' 
  get 'posts/show'
  get 'posts/create'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/destroy'
  post 'draft', to: 'posts#draft'
  get 'posts/draft_show'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  # root "homes#index"

  # get 'posts/search' => 'posts#search'
  get "posts/download"
  # get 'cities/:state', to: 'application#cities'
  get 'usera/state' => 'users#state'

  resources :posts
  # resources :states, only: :index
  get 'sign_up', to: 'states#index'
  get 'towns', to: 'towns#city'

end
