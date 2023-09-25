class Retweet < ApplicationRecord
  belongs_to :retweeting_user, class_name: "User"
  belongs_to :retweeted_tweet, class_name: "Tweet"
end
