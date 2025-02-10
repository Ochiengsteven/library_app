Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  authenticated :user do
    root 'books#index', as: :authenticated_root
    resources :books
  end

  devise_scope :user do
    root 'devise/sessions#new'
  end

  # Keep health check endpoint
  get "up" => "rails/health#show", as: :rails_health_check
end