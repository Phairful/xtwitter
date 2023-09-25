class Like < ApplicationRecord
    belongs_to :liking_user, class_name: "User"
    belongs_to :liked_tweet, class_name: "Tweet"

     #created the validation for only having 1 like per tweet per user
    validates :liked_tweet_id, 
        uniqueness: true
    validates :liking_user_id, 
        uniqueness: true
    #created the association validation for the relations between tables user & tweet to like
    validates_associated :liking_user, :liked_tweet
end
