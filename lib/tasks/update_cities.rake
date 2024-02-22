namespace :update_cities do
  desc "Update cities"
  task update: :environment do
    CS.update
  end
end
