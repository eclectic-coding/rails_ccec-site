Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users

  authenticate :user, lambda { |u| u.has_role?(:admin) || u.has_role?(:superadmin) } do
    namespace :admin do
      # if defined?(Sidekiq)
      #   require "sidekiq/web"
      #   mount Sidekiq::Web => "/sidekiq"
      # end
      resources :accounts, only: [:index, :show]
      resources :account_users, only: [:show, :new, :create, :destroy]
      resources :users, only: :index do
        resources :users_name, only: [:edit, :update], module: :users
        resources :users_username, only: [:edit, :update], module: :users
        resources :users_email, only: [:edit, :update], module: :users
        resources :users_role, only: [:edit, :update], module: :users
      end
      resources :events do
        collection do
          get :list
        end
      end
      resources :addresses

      root to: "dashboard#show"
    end
  end

  resources :events, only: [:index, :show]

  # public static pages
  get "information", to: "static#info"
  get "attending", to: "static#attending"
  get "questions", to: "static#questions"
  get "sponsorship", to: "static#sponsorship"

  root to: "static#home"
end
