FactoryBot.define do
  factory :follow do
    follower_user_id { 1 }
    followee_user_id { 1 }
  end
end
