class Tagging < ApplicationRecord
  belongs_to :tagged_hashtag, class_name: "Hashtag"
  belongs_to :tagged_tweet, class_name: "Tweet"
end
