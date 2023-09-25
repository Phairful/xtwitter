FactoryBot.define do
  factory :tweet do
    tweet_body { "MyString" }
    user_id { 1 }
    tweet_id { 1 }
  end
end
