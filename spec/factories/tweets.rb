require 'faker'

FactoryBot.define do
  factory :tweet do
    association :user, factory: :user
    tweet_body { Faker::Lorem.paragraphs}
    
 
    #reply_at_tweet_id { [nil, rand(1..100)] }

 

  end
end

