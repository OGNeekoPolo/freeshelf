Rails.application.routes.draw do
  get 'users/index'

  get 'users/new'

  post 'users/new', to: 'users#create'

  resources :books

  get '/logout', to: 'sessions#destroy', as: :logout

  post '/books/new', to: 'books#create'

  post 'books/:id/edit', to: 'books#update'

  post 'users/index', to: 'sessions#create'

  root 'users#index'
end
