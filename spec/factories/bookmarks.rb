FactoryBot.define do
  factory :bookmark do
    bookmarked_tweet_id { association :tweet }
    bookmarking_user_id { association :user }
  end
end
