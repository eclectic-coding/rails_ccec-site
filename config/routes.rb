require "sidekiq/web"

Rails.application.routes.draw do

  # if Rails.env.development? || Rails.env.test?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end_time

  devise_for :users

  authenticate :user, lambda { |u| u.has_role?(:admin) || u.has_role?(:superadmin) } do
    mount Sidekiq::Web => "/sidekiq"

    namespace :admin do
      resources :accounts
      resources :account_users, only: [:index, :show, :new, :create, :destroy] do
        resources :account_users_name, only: [:edit, :update], module: :account_users
        resources :account_users_email, only: [:edit, :update], module: :account_users
        resources :account_users_role, only: [:edit, :update], module: :account_users
      end
      resources :events

      root to: "dashboard#show"
    end
  end

  resources :events, only: [:index, :show]

  root to: "home#index"
end
