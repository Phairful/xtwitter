# == Schema Information
#
# table "bookmarks", 
#  t.integer "tweet_id"
# t.integer "user_id"
#  t.datetime "created_at", null: false
#  t.datetime "updated_at", null: false
#
#----------------------------------------------------------------------------------------------------------

class Bookmark < ApplicationRecord
#created the association validation for the relations between tables bookmark to tweet and user
  belongs_to :tweet, class_name: "Tweet"
  belongs_to :user, class_name: "User"

#----------------------------------------------------------------------------------------------------------
  #created the validation for only having 1 bookmark per tweet per user
  validates :user, 
    uniqueness: {scope: :tweet, message: "Has already been bookmarked"}
  



    #validates_associated :user
    #validates_associated :tweet
  
    validates :user_id, presence: true
    validates :tweet_id, presence: true
  
    #scope :user_bookmarks, ->(user_id) { where(user_id: user_id) }
end
