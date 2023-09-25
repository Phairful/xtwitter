FactoryBot.define do
  factory :bookmark do
    bookmarked_tweet_id { 1 }
    bookmarking_user_id { 1 }
  end
end
