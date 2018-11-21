FactoryBot.define do
  factory :comment do
    commenter { "New comment" }
    article
    user
  end
end