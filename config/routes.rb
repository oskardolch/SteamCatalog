Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "searches#show"

  get 'logins/show'
  post 'logins/show', to: 'logins#create'
  get 'logins/logout', to: 'logins#destroy'
  post 'language/change', to: 'application#set_locale'
  get 'search', to: 'searches#show'
  post 'search', to: 'searches#search'
  get 'search/clear', to: 'searches#clear'

  resources :users
  resources :editors
  resources :makers
  resources :operators
  resources :qualities
  resources :views
  resources :accessories
  resources :literatures
  resources :engine_types
  resources :engines
  resources :occurrences
end
