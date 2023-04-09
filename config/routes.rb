require "sidekiq/web"

Rails.application.routes.draw do
  if Rails.env.development? || Rails.env.test?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users

  authenticate :user, lambda { |u| u.has_role?(:admin) || u.has_role?(:superadmin) } do
    mount Sidekiq::Web => "/sidekiq"

    namespace :admin do
      resources :accounts
      resources :account_users

      root to: "dashboard#show"
    end
  end

  root to: "home#index"
end
