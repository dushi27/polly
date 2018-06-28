Rails.application.routes.draw do
  resources :surveys
  resources :answers
  root to: 'pages#index'
  devise_for :users
  resources :users
  
  mount ActionCable.server, at: '/cable'
end
