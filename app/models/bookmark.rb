class Bookmark < ApplicationRecord
  belongs_to :tweet, class_name: "Tweet"
  belongs_to :user, class_name: "User"

#----------------------------------------------------------------------------------------------------------

  #created the validation for only having 1 bookmark per tweet per user
  validates :tweet_id, 
    uniqueness: true
  validates :user_id, 
    uniqueness: true
    
  #created the association validation for the relations between tables bookmark to tweet and user
  validates :user, 
    uniqueness: {scope: :tweet}
  
end
