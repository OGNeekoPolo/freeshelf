Rails.application.routes.draw do
  get 'users/index'

  get 'users/new'

  resources :users
  resources :books

  post '/books/new', to: 'books#create'

  post 'books/:id/edit', to: 'books#update'

  root 'books#index'
end
