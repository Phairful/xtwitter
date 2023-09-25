FactoryBot.define do
  factory :tweet do
    tweet_body { "MyString" }
    tweeting_user_id { 1 }
    reply_at_tweet_id { 1 }
  end
end
