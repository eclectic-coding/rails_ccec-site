FactoryBot.define do
  factory :account_user do
    name { "Example User" }
    association :user
    association :account
  end
end
