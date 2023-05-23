Rails.application.routes.draw do
  resources :items
  get 'home/index'
  root 'home#index'
  get 'items/index'
  get 'api/items', to:'items#index'
  get 'api/items/:id', to: 'items#show'
  post'api/items', to: 'items#create'
  get 'api/items/edit/:id', to: 'items#update'
  get 'api/items/delete/:id', to: 'items#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
