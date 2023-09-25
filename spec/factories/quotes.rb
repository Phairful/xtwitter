FactoryBot.define do
  factory :quote do
    quote_body { "MyString" }
    quoting_user_id { 1 }
    quoted_tweet_id { 1 }
    tweet_quote_id { 1 }
  end
end
