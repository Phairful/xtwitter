class Tagging < ApplicationRecord
  belongs_to :tagged_hashtag, class_name: "Hashtag"
  belongs_to :tagged_tweet, class_name: "Tweet"
  #created the association validation for the relations between tables hashtag & tweet to follower
  validates_associated :tagged_hashtag, :tagged_tweet
end
