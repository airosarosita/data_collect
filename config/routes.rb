Rails.application.routes.draw do
  resources :contents
  root "statics#index"
  
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  
  # Admin routes
  namespace :admin do
    resources :tests
    resources :contents

    resources :lessons do
    resources :contents, only: [:new, :create]
    end
      get 'content'
    
    get 'dashboards', to: 'dashboards#index', as: 'dashboards'
    resources :lessons, only: [:new, :create, :index, :edit]
    resources :contents
  end
  resources :statics
  resources :answers
  resources :questions
  devise_for :users

   # Client routes
   resources :contents
   resources :lessons
   # Add other client routes here
  

  

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

