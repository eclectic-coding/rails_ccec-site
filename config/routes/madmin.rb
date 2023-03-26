# Below are the routes for madmin
namespace :madmin do
  resources :users
  resources :announcements
  resources :roles
  resources :services
  namespace :active_storage do
    resources :attachments
  end
  namespace :active_storage do
    resources :blobs
  end
  namespace :active_storage do
    resources :variant_records
  end
  root to: "dashboard#show"
end
