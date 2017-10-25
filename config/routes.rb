Rails.application.routes.draw do
  resources :users

  resources :posts do
    resources :comments
  end

  root to: 'posts#index'
end
