Rails.application.routes.draw do
  resources :questions
  resources :answers

  devise_for :users
  resources :users
  
  authenticated :user do
    root 'questions#index', as: :authenticated_root
  end
  root to: 'pages#index'

  get '/:short_code', to: 'answers#new'
  mount ActionCable.server, at: '/cable'
end
