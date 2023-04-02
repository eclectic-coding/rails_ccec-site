require "sidekiq/web"

Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.has_role?(:admin) } do
    mount Sidekiq::Web => "/sidekiq"

    namespace :admin do
      root to: "dashboard#show"
    end
  end

  devise_for :users

  root to: "home#index"
end
