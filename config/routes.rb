require "sidekiq/web"

Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # public static pages
  get "information", to: "static#info"
  get "attending", to: "static#attending"
  get "questions", to: "static#questions"
  get "sponsorship", to: "static#sponsorship"
  get "thank_you", to: "static#thank_you"

  get "contact_us", to: "messages#new", as: :messages_new
  post "contact_us", to: "messages#create", as: :messages

  resources :events, only: [:index, :show]

  devise_for :users
  authenticate :user, lambda { |u| u.has_role?(:admin) || u.has_role?(:superadmin) } do
    mount Sidekiq::Web => "/sidekiq"

    namespace :admin do
      resources :accounts, only: [:index]
      resources :account_users, only: [:show, :new, :create]
      resources :users, only: [:show, :edit, :update, :destroy]
      resources :editables, only: [:index, :new, :create, :edit, :update, :destroy]
      resources :editables_activation, only: [:update]
      resources :prayer_vigils

      resources :events do
        collection do
          get :list
        end
      end

      resource :event, module: :events do
        resources :addresses, only: [:new, :create]
      end

      resources :media_uploads, except: :show
      resources :addresses, except: :show
      resources :messages, only: [:index, :show]
      resources :message_recipients, only: [:index, :show, :new, :create]

      root to: "dashboard#show"
    end
  end

  resource :members, only: :show
  namespace :members do
    get "sponsorship", to: "sponsorship#index"
    get "directions", to: "directions#index"
  end

  root to: "static#home"
end
