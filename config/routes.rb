require "sidekiq/web"

Rails.application.routes.draw do
  namespace :admin do
    namespace :account_users do
      get 'account_users_name/edit'
    end
  end
  if Rails.env.development? || Rails.env.test?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users

  authenticate :user, lambda { |u| u.has_role?(:admin) || u.has_role?(:superadmin) } do
    mount Sidekiq::Web => "/sidekiq"

    namespace :admin do
      resources :accounts
      resources :account_users, only: [:index, :show, :new, :create, :destroy] do
        resources :account_users_name, only: [:edit, :update], module: :account_users
      end

      root to: "dashboard#show"
    end
  end

  root to: "home#index"
end
