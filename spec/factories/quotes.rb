FactoryBot.define do
  factory :quote do
    quote_body { "MyString" }
    user_id { 1 }
    tweet_id { 1 }
    tweet_quote_id { 1 }
  end
end
