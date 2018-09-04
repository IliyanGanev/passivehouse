Rails.application.routes.draw do


  root 'static_pages#home'

  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/demo', to: 'static_pages#demo'

  get  '/upload_form', to: 'static_pages#upload_form'

  get  '/autocad', to: 'static_pages#autocad'
  get  '/revit', to: 'static_pages#revit'
  get  '/vectorworks', to: 'static_pages#vectorworks'

  get '/signup', to: 'users#new'
  # post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy, :edit, :update, :index]
end
