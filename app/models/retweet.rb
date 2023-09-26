# == Schema Information
#
#
#create_table "retweets"
#
#  t.integer "tweet_id"#
#  t.integer "user_id"
#  t.datetime "created_at", null: false
#  t.datetime "updated_at", null: false
#----------------------------------------------------------------------------------------------------------

class Retweet < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :tweet, class_name: "Tweet"

#----------------------------------------------------------------------------------------------------------
   #created the validation for only having 1 retweet per tweet per user
    validates :user_id, 
        uniqueness: {scope: :tweet_id}

  #created the association validation for the relations between tables user & tweet to retweet
  validates_associated :user, :tweet
end
