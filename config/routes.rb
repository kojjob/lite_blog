Rails.application.routes.draw do
  root "home#index"


  devise_for :users

  resources :posts do
    resources :comments, only: [ :create, :destroy ]
  end

  resources :categories, only: [ :index, :show ]

  get "dashboard", to: "dashboard#index"

  post "follow/:id", to: "follow#create", as: "follow"
  post "unfollow/:id", to: "follow#destroy", as: "unfollow"

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
