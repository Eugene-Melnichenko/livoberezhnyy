FactoryBot.define do
  factory :order do
    user
    service
    message { "My Message" }
  end
end
