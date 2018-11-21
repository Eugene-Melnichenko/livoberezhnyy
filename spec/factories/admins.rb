FactoryBot.define do
  factory :admin do
    sequence(:email) { |i| "admin#{i}@gmail.com" }
    password { "password" }
    password_confirmation { "password"}
  end
end
