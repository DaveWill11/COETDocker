Rails.application.routes.draw do
  resources :items
  get 'home/index'
  root 'home#index'
  get 'items/index'

  scope 'api' do
    
    get 'items', to:'api#index'
    get 'items/:id', to: 'api#show'
    post'items', to: 'api#create'
    put 'items/:id', to: 'api#update'
    delete 'items/:id', to: 'api#destroy'
    post 'login', to: 'user#login'
    get 'user', to: 'user#show'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
