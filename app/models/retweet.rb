class Retweet < ApplicationRecord
  belongs_to :retweeting_user, class_name: "User"
  belongs_to :retweeted_tweet, class_name: "Tweet"


   #created the validation for only having 1 retweet per tweet per user
  validates :retweed_tweet_id, 
    uniqueness: true
  validates :retweeting_user_id, 
    uniqueness: true


  #created the association validation for the relations between tables user & tweet to retweet
  validates_associated :retweeting_user, :retweeted_tweet
  
  
  scope :retweet_count, ->(tweet_info) { where(retweeted_tweet: tweet_case).count}
  scope :retweets_by_user, ->(using_user) { where(retweeting_user_id: using_user)}

  def retweeting (user_you, tweet_case)
    Retweet.new retweeting_user_id:user_you, retweed_tweet_id:tweet_case.
  end
end
