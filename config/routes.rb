require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users

  authenticate :user, lambda { |u| u.has_role?(:admin) } do
    mount Sidekiq::Web => "/sidekiq"

    namespace :admin do

      root to: "dashboard#show"
    end
  end

  root to: "home#index"
end
