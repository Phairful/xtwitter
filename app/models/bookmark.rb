class Bookmark < ApplicationRecord
  belongs_to :bookmarked_tweet, class_name: "Tweet"
  belongs_to :bookmarking_user, class_name: "User"
  
  #created the validation for only having 1 bookmark per tweet per user
  validates :bookmarked_tweet_id, 
    uniqueness: true
  validates :bookmarking_user_id, 
    uniqueness: true
  #created the association validation for the relations between tables bookmark to tweet and user
  validates_associated :bookmarked_tweet, :bookmarking_user
end
