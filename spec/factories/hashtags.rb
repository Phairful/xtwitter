FactoryBot.define do
  factory :hashtag do
    hashtag_body { Faker::Lorem.word }
  end
end
