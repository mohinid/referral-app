FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    factory :referred_user do
      association :referred_by, factory: :user
    end
  end
end
