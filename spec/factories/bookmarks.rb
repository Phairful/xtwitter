
FactoryBot.define do
  factory :bookmark do
    association :tweet, factory: :tweet
    association :user, factory: :user
  end
end