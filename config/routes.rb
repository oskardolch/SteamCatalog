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
  post 'search/filter/set', to: 'searches#filter_set'
  post 'engines/filter/type', to: 'engines#filter_type'
  post 'engines/filter/operator', to: 'engines#filter_operator'
  post 'search/filter/type', to: 'searches#filter_type'
  post 'search/filter/operator', to: 'searches#filter_operator'
  get 'occurrence/new_with_template', to: 'occurrences#new_with_template'

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
