class Like < ApplicationRecord
    belongs_to :user, class_name: "User"
    belongs_to :tweet, class_name: "Tweet"

#----------------------------------------------------------------------------------------------------------

     #created the validation for only having 1 like per tweet per user
    validates :user_id, 
        uniqueness: {scope: :tweet_id}

    #created the association validation for the relations between tables user & tweet to like
    validates_associated :user, :tweet
end
