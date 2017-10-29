Rails.application.routes.draw do
  resources :users, only: [:create]
  resource :session, only: [:create]

  resource :confirmation

  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  
  get 'register' => 'users#new'

  resources :posts do
    resources :comments
  end

  root to: 'posts#index'
end
