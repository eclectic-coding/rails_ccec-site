require "sidekiq/web"

Rails.application.routes.draw do
  # if Rails.env.development? || Rails.env.test?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end_time

  devise_for :users

  authenticate :user, lambda { |u| u.has_role?(:admin) || u.has_role?(:superadmin) } do
    namespace :admin do
      resources :accounts, only: [:index, :show]
      resources :account_users, only: [:show, :new, :create, :destroy]
      resources :users do
        resources :users_name, only: [:edit, :update], module: :users
        resources :users_email, only: [:edit, :update], module: :users
        resources :users_role, only: [:edit, :update], module: :users
      end
      resources :events

      root to: "dashboard#show"
    end
  end

  resources :events, only: [:index, :show]

  root to: "home#index"
end
