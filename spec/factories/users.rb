FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "email#{i}@gmail.com" }
    password { "password" }
    password_confirmation { "password"}
  end
end
