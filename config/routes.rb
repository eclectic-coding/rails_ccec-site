require 'sidekiq/web'

Rails.application.routes.draw do

  authenticate :user, lambda { |u| u.has_role? :admin } do
    mount Sidekiq::Web => '/sidekiq'
    draw :madmin

    namespace :madmin do
      resources :impersonates do
        post :impersonate, on: :member
        post :stop_impersonating, on: :collection
      end
    end
  end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'
end
