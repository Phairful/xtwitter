FactoryBot.define do
  factory :tagging do
    association :hashtag, factory: :hashtag
    association :tweet, factory: :tweet
  end
end
