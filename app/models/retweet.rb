class Retweet < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :tweet, class_name: "Tweet"

#----------------------------------------------------------------------------------------------------------
#hello
   #created the validation for only having 1 retweet per tweet per user
#  validates :retweed_tweet_id, 
#    uniqueness: true
#  validates :retweeting_user_id, 
#    uniqueness: true

    validates :user_id, 
        uniqueness: {scope: :tweet_id}

  #created the association validation for the relations between tables user & tweet to retweet
  validates_associated :user, :tweet
end
