Rails.application.routes.draw do
  get 'pages/welcome'

  root 'messages#index'
  # root 'pages#welcome'
  resources :users
  resources :messages
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/welcome',  to: 'pages#welcome'
  mount ActionCable.server, at: '/cable'
end
