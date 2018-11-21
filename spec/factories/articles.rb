FactoryBot.define do
  factory :article do
    title { "New title" }
    text { "New text" }
    admin
  end
end