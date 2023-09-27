FactoryBot.define do
  factory :retweet do
    association :tweet, factory: :tweet
    association :user, factory: :user
  end
end
