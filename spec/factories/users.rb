FactoryBot.define do
  factory :user do
    name { "Example User" }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
    account

    trait :super_admin do
      after(:create) { |user| user.add_role(:superadmin) }
    end

    trait :admin do
      after(:create) { |user| user.add_role(:admin) }
    end

    trait :member do
      after(:create) { |user| user.add_role(:member) }
    end
  end
end
