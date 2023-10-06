# == Schema Information
#
#   create_table "likes"
#
#    t.integer "tweet_id"
#    t.integer "user_id"
#    t.datetime "created_at", null: false
#    t.datetime "updated_at", null: false
#----------------------------------------------------------------------------------------------------------

class Like < ApplicationRecord
    belongs_to :user, class_name: "User"
    belongs_to :tweet, class_name: "Tweet"

#----------------------------------------------------------------------------------------------------------

    #created the validation for only having 1 like per tweet per user
    #created the association validation for the relations between tables user & tweet to like
    # validates_associated :user 
    # validates_associated :tweet
  
    validates :tweet_id, presence: true
    validates :user_id, presence: true, uniqueness: {scope: :tweet_id, message: "Has already been liked"}
end
