Rails.application.routes.draw do
  resources :questions
  resources :surveys
  resources :answers

  devise_for :users
  resources :users
  
  authenticated :user do
    root 'questions#index', as: :authenticated_root
  end
  root to: 'pages#index'

  mount ActionCable.server, at: '/cable'
end
