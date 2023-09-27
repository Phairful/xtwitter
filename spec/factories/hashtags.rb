require 'faker'

FactoryBot.define do
  factory :hashtag do
    hashtag_body { Faker::Lorem.words }
  end
end
