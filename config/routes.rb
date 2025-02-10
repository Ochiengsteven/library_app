Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  authenticated :user do
    root 'books#index', as: :authenticated_root
    
  end

  resources :books do
    member do
      post :borrow
      post :return
    end
  end
  get 'profile', to: 'users#profile'

  devise_scope :user do
    root 'devise/sessions#new'
  end

  # Keep health check endpoint
  get "up" => "rails/health#show", as: :rails_health_check
end