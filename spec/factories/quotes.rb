FactoryBot.define do
  factory :quote do
    association :tweet, factory: :tweet
    association :user, factory: :user
    quote_body { Faker::Lorem.sentence(word_count: rand(1..255))}
  end
end
