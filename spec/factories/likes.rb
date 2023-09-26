FactoryBot.define do
  factory :like do
    tweet_id { association }
    user_id { 1 }
  end
end
