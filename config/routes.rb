Rails.application.routes.draw do
  
  namespace :auth do
    resources :users, only: [:create]
    resource :session, only: [:create]
    resource :confirmation, only: [:new]
  end

  namespace :admin do
    resources :posts do
      get '/statuses/:status', to: 'posts#index', as: :by_status, on: :collection
    end
    root to: 'posts#index'
  end

  get 'login' => 'auth/sessions#new'
  delete 'logout' => 'auth/sessions#destroy'
  get 'register' => 'auth/users#new'

  resources :posts do
    resources :comments
  end

  root to: 'posts#index'
end
